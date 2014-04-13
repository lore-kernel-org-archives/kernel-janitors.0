From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Sun, 13 Apr 2014 03:35:45 +0000
Subject: Need Clarification about Whether i can change some Specific Staging Code
Message-Id: <534A0341.1050303@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Greg,

I was checking drivers code to see which are still using semaphore. I 
found some in staging. When i opened the code for upgrading that to 
MUTEX i found a note. that says:

  *    NOTE TO LINUX KERNEL HACKERS:  DO NOT REFORMAT THIS CODE!
  *
  *    This is shared code between Digi's CVS archive and the
  *    Linux Kernel sources.
  *    Changing the source just for reformatting needlessly breaks
  *    our CVS diff history.
  *
  *    Send any bug fixes/changes to:  Eng.Linux at digi dot com.
  *    Thank you.
  */

Involved codes are
./drivers/staging/dgap/dgap_tty.c
  ./drivers/staging/dgnc/dgnc_tty.c

Please let me know if i can submit a patch against these files.

Regards
Kumar Gaurav
