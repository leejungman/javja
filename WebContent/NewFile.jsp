<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글에 따라 숫자가 늘어남</title>
 
    <!--제이쿼리-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
 
</head>
<body>
    
    <textarea id="test" name="test" cols="30" rows="10"></textarea>
    <div id="test_cnt">(0 / 100)</div>
 
    <script>
 
    $(document).ready(function() {
        $('#test').on('keyup', function() {
            $('#test_cnt').html("("+$(this).val().length+" / 100)");
 
            if($(this).val().length > 100) {
                $(this).val($(this).val().substring(0, 100));
                $('#test_cnt').html("(100 / 100)");
            }
        });
    });
        
    </script>
 
</body>
</html>