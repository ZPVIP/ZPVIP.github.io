		○︿
		︶\
		 √ ﹀ . 。o O . ~~
=====================================================
=	TITLE       : CLASS clsUpload					=
=	FILE        : class_upload.php					=
=	DESCRIPTION : To provide upload utility,		=
=	AUTHOR      : Peng Zhang zpregister()gmail.com	=
=	                http://blog.neten.de 			=
=	BASED ON    : whxbb whxbb()21cn.com				=
=	WRITED      : 2005 NOV 20						=
=	MODIFIED    : 2006 MAR 01						=
=	LICENCE     : GPL								=
=	REVISION    : V1.0.2							=
=====================================================


使用授权：GPL（不能应用于任何商业用途，无须经过作者同意即可修改代码，但修改后的代码必须按照GPL协议发布）

使用方法
========
1,将包内两文件解压到网站任意目录下，
2,在浏览器中打开up.php，因为例中限定了只能上传图片文件，所以其它格式文件上传会失败。

注意
====
1,如果上传其它类型文件，请设置好文件类型，如
  $fileFormat = array('doc','zip','gz');

2,非图片文件，请不要调用生成缩略图的功能，即去掉语句
  $f->setThumb(1);


作者:张鹏
最后更新于 2006年3月1日

欢迎访问
http://www.neten.de
http://bbs.neten.de
