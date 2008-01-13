From: "Paolo Ciarrocchi" <paolo.ciarrocchi@gmail.com>
Date: Sun, 13 Jan 2008 21:26:11 +0000
Subject: Statistics with checkpatch.pl
Message-Id: <4d8e3fd30801131326n263c3b57t32289bcb49303e35@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,
I wrote the following script based on checkpatch.pl:

find . -name '*.c' |xargs ../../scripts/checkpatch.pl --file |grep -B
1 ^total | awk '/^total/{ errors+=$2; warnings+=$4; lines+=$6; } {
print } END  {print ""; print "--- Report ---";print "number of files
"(NR+1)/3; print "number of errors: "errors; print "number of
warnings: "warnings; print "number of lines: "lines; print "% errors:
"errors/lines*100;print "% warning: "warnings/lines*100;}'

For example, I run it in the /arch/x86/ dir in the mm branch of the
x86 git tree.

What I got is the following:
...
...
...
...
./xen/mmu.c
total: 0 errors, 0 warnings, 644 lines checked
--
./xen/multicalls.c
total: 2 errors, 2 warnings, 138 lines checked
--
./xen/setup.c
total: 0 errors, 7 warnings, 110 lines checked
--
./xen/smp.c
total: 1 errors, 1 warnings, 421 lines checked
--
./xen/time.c
total: 3 errors, 3 warnings, 599 lines checked

--- Report ---
number of files 314
number of errors: 3498
number of warnings: 2421
number of lines: 115226
% errors: 3.03577
% warning: 2.10109

This is after applying the following patch to checkpatch.pl (probabily
wordwrapped, but that's just to give you an idea):
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 579f50f..079c73c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1580,6 +1580,7 @@ sub process {

        print report_dump();
        if ($summary) {
+               print "$filename \n";
                print "total: $cnt_error errors, $cnt_warn warnings, " .
                        (($check)? "$cnt_chk checks, " : "") .
                        "$cnt_lines lines checked\n";

Does anybody have an idea on how to get the 10 most offenders file
from the output of my script?

Thanks.

Ciao,
-- 
Paolo
http://paolo.ciarrocchi.googlepages.com/
