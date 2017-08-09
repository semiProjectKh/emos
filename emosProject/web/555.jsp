<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>infinite scroll</title>
    <script src="https://code.jquery.com/jquery-3.1.1.js" integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA=" crossorigin="anonymous"></script>
    <style>
        .local-scroll {
            width: 670px;
            height: 220px;
            overflow-x: hidden;
            overflow-y: scroll;
            background: powderblue;
        }
        th{border: 1px solid gray;}
    </style>
</head>

<body>
    <div class="local-scroll">
        <table>
            <thead>
                <th>seq</th>
                <th>oeeRate</th>
                <th>status</th>
                <th>keepSecond</th>
            </thead>
            <tbody></tbody>
        </table>
    </div>
    <script>
        var
            testData = [],
            customTemplate = [];

        for (var j = 0; j < 501; j++) {
            testData.push({
                oeeRate: "98%",
                keepSecond: "200",
                status: "auto",
                seq: j
            });
        }

        var infiScroll = (function() {
            var
              pos = 0,
              deleteCount = 20,
              orgData = null,
              template = null,
              container,
              content,
              destination;

            //detect scroll
            var detect = function() {
                if (content.height() < container.height()) {
                    //스크롤이 생기지 않았을 경우
                    //alert("There isn't a vertical scroll bar");
                    moveTo();
                }
                container.scroll(function() {
                    var
                        scrollTop = container.scrollTop(),
                        contentsHeight = Math.floor(content.height() - container.height());
                    if (scrollTop >= contentsHeight) {
                        moveTo();
                    }
                });
            },
            setCnt = function(num){
                deleteCount = num;
            },
            setObjects = function(containerSelector, contentSelector, appendSelector){
                container = $(containerSelector),
                content = $(contentSelector),
                destination = $(appendSelector);
            }
            moveTo = function() {
                var
                    startPos  = pos,
                    endPos = deleteCount,
                    displayData = orgData.splice(startPos, endPos),
                    displayDataLen = displayData.length;
                if(displayDataLen){
                    console.log(JSON.stringify(displayData));
                    append(displayData);
                }
            },
            append = function(displayData) {            //append data
                var html = [], displayDataLen = displayData.length;
                var convertedTemplate = "";
                for (var i = 0; i < displayDataLen; i++) {
                    convertedTemplate = template
                    .replace("@{seq}",        displayData[i].seq)
                    .replace("@{oeeRate}",    displayData[i].oeeRate)
                    .replace("@{status}",     displayData[i].status)
                    .replace("@{keepSecond}", displayData[i].keepSecond);
                    html.push(convertedTemplate);
                }
                // console.log(html.join(""));
                destination.append(html.join(""));
            },
            setData = function(data){
                //console.log("========원본========");
                //console.log(JSON.stringify(data));
                orgData = data;
            },
            setTemplate = function(customTemplate){
                template = customTemplate;
                // console.log(template);
            },
            initial = function(param){
                setCnt(param.cnt);
                setObjects(param.containerSelector,param.contentSelector,param.appendSelector);
                detect();
            };
            return {
                setData     : setData,
                setTemplate : setTemplate,
                detect      : detect,
                initial     : initial
            };
        }());
        infiScroll.setData(testData);
        customTemplate.push(
            "<tr>",
            "<td>@{seq}</td>",
            "<td>@{oeeRate}</td>",
            "<td>@{status}</td>",
            "<td>@{keepSecond}</td>",
            "</tr>"
        );
        infiScroll.setTemplate(customTemplate.join(""));
        infiScroll.initial({containerSelector: ".local-scroll", contentSelector: "table", appendSelector: "table tbody",cnt : 20});
    </script>
</body>

</html>
