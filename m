From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 06 Sep 2007 09:21:53 +0000
Subject: [PATCH] Documentation:  Delete unreferenced xterm-linux.xpm file.
Message-Id: <Pine.LNX.4.64.0709060518550.4022@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

as amusing as a penguin xpm file is, i don't think it's the kernel's
job to be carrying it around if absolutely nothing else in the tree
refers to it.

of course, if there *is* a reason for it to be there, that's cool,
too.  it's not like i feel strongly about it either way.


 Documentation/00-INDEX        |    2 -
 Documentation/xterm-linux.xpm |   61 --------------------------------
 2 files changed, 63 deletions(-)

diff --git a/Documentation/00-INDEX b/Documentation/00-INDEX
index 8b05636..e5393a1 100644
--- a/Documentation/00-INDEX
+++ b/Documentation/00-INDEX
@@ -420,7 +420,5 @@ watchdog/
 	- how to auto-reboot Linux if it has "fallen and can't get up". ;-)
 x86_64/
 	- directory with info on Linux support for AMD x86-64 (Hammer) machines.
-xterm-linux.xpm
-	- XPM image of penguin logo (see logo.txt) sitting on an xterm.
 zorro.txt
 	- info on writing drivers for Zorro bus devices found on Amigas.
diff --git a/Documentation/xterm-linux.xpm b/Documentation/xterm-linux.xpm
deleted file mode 100644
index f469c1a..0000000
--- a/Documentation/xterm-linux.xpm
+++ /dev/null
@@ -1,61 +0,0 @@
-/* XPM */
-/*****************************************************************************/
-/**       This pixmap was made by Torsten Poulin - 1996 - torsten@diku.dk   **/
-/**       It was made by combining xterm-blank.xpm with                     **/
-/**       the wonderfully cute Linux penguin mascot by Larry Ewing.         **/
-/**       I had to change Larry's penguin a little to make it fit.          **/
-/**       xterm-blank.xpm contained the following comment:                  **/
-/**       This pixmap is kindly offered by Ion Cionca - 1992 -              **/
-/**       Swiss Federal Institute of Technology                             **/
-/**       Central Computing Service                                         **/
-/*****************************************************************************/
-static char * image_name [] = {
-/**/
-"64 38 8 1",
-/**/
-" 	s mask	c none",
-".	c gray70",
-"X	c gray85",
-"o	c gray50",
-"O	c yellow",
-"+	c darkolivegreen",
-"@	c white",
-"#	c black",
-"              ######                                            ",
-"             ########                                           ",
-"            ##########    ...........................           ",
-"            ###########  .XXXXXXXXXXXXXXXXXXXXXXXXXXX.          ",
-"            ########### .XXXXXXXXXXXXXXXXXXXXXXXXXXXXXoo        ",
-"            #@@@#@@@### .XX+++++++++++++++++++++++XXXXoo        ",
-"            #@#@#@#@### .XX++++++++++++++++++++++++XXXooo       ",
-"            #@#####@### .XX++@@+@++@+@@@@++@+++++++XXXooo       ",
-"            ###OOO######.XX++++++++++++++++++++++++XXXoooo      ",
-"            ##OOOOOO####.XX++@@@@+@@+@@@+++++++++++XXXoooo      ",
-"            #O#OOO#O####.XX++++++++++++++++++++++++XXXooooo     ",
-"            ##O###OO####.XX++@@@@@@@@@@+@@@@@++++++XXXooooo     ",
-"            ###OOOO@#####XX++++++++++++++++++++++++XXXooooo     ",
-"           ##@###@@@@####XX++@@@+@@@@+@@++@@@++++++XXXooooo     ",
-"           #@@@@@@@@@@####X++++++++++++++++++++++++XXXooooo     ",
-"          ##@@@@@@@@@@#####++@+++++++++++++++++++++XXXooooo     ",
-"         ###@@@@@@@@@@######+++++++++++++++++++++++XXXooooo     ",
-"        ####@@@@@@@@@@@#####+@@@@+@+@@@+@++++++++++XXXooooo     ",
-"        ###@@@@@@@@@@@@######++++++++++++++++++++++XXXooooo     ",
-"        ##@@@@@@@@@@@@@@#####@+@@@@++++++++++++++++XXXooooo     ",
-"       ###@@@@@@@@@@@@@@######++++++++++++++++++++XXXXoooo      ",
-"       ###@@@@@@@@@@@@@@######XXXXXXXXXXXXXXXXXXXXXXXXooo       ",
-"      ###@@@@@@@@@@@@@@@######XXXXXXXXXXXXXXXXXXXXXXXooo        ",
-"      ###@@@@@@@@@@@@@@@@#####ooooooooooooooooooooooo...oo      ",
-"      ###@@@@@@@@@@@@@@@######.........................ooo      ",
-"     #OO##@@@@@@@@@@@@@#######oooooooooooooooooooooooooooo      ",
-"     #OOO##@@@@@@@@@@@#OO####O#XXXXXXXXXXXXXXXXXXXXXXXoooo.. .. ",
-"  ###OOOOO##@@@@@@@@@@#OOO#OOO#XXXXXXXXXXXXXX#######XXoooo  .  .",
-" #OOOOOOOO###@@@@@@@@@#OOOOOOO#ooooooooooooooooooooXXXooo     . ",
-" #OOOOOOOOO###@@@@@@@@@#OOOOOOO##XXXXXXXXXXXXXXXXXooooo      .  ",
-"  #OOOOOOOOO#@@@@@@@@###OOOOOOOOO#XXXXXXXXXXXXXXXoo      oooooo ",
-"  #OOOOOOOOO#@@@@@@@####OOOOOOOO#@@@@@@@@@@@XXXXXoo   ooooo...o ",
-" #OOOOOOOOOOO###########OOOOOO##XXXXXXXXXXXXXXXXoo   ooXXXoo..o ",
-"  ##OOOOOOOOO###########OOOO##@@@@@@@@@@@@@XXXXoo    oXXXXX..o  ",
-"     ###OOOO###    oXX##OOO#XXXXXXXXXXXXXXXXXXoo     o.....oo   ",
-"         ####      oooo####oooooooooooooooooooo      ooooooo    ",
-"                                                                ",
-"                                                                "};
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
