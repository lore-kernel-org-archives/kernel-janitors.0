From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 02 Dec 2007 09:32:43 +0000
Subject: [RFC] "Centralized" scanning of the source-code.
Message-Id: <47527BBB.90403@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all

Would like to hear your opinion on a little proposal:

I have a server who wastes quite a few cpu-cycles, and for a couple of 
months, it has been compiling a 'allyesconfig', 'allmodconfig' and 
'allnoconfig' i386-kernel every week, with 'C=2'. Most of the successful 
logs are saved and I also wrote a small diff-script in PHP (it first 
uses 'diff' and then it tries to remove as much cruft as possible, to 
show new warnings) (no guaranty on the script).

But lately, I have also made a little "code-checker" (sound more fancy 
then it really is) by making small scripts, who preform certain simple 
tests (like finding "hand-coded" abs()/min()/max(), spelling-errors, 
Kconfig-errors etc), all executed by 'scripts.sh' during the "scanning" 
(each script can be used separately).

What I am suggesting is: by collecting all this about a certain 
area/subsystem, a janitor can clean it up with a single/few 
patch-set(s), reducing the maintainer's headache, and when it is done, 
monitor those areas for introduction of new "errors". In such a case, we 
can easily use git-blame to find the route the offending commit has 
taken, and use it when sending the patch. Also, referring the patch as a 
cleanup for the recent commit X, should make the patch even more attractive.

If a subsystem is clean(ed), a special log will be made for it, to make 
it easier to find introduced "errors".


The rest of the mail is about the more practical aspects...

Right now, the homepage for it is 
"http://lserver.campus.ltu.se/linux_kj/" (may get a better name later, 
ex on dyndns.org (any ideas on names?)). I have basically just moved my 
files (logs and scripts) there, so any suggestions on how to present it 
better is welcome.

I am just following Linus' git-tree for the moment, but if there is a 
need to follow other trees, just let me know how to follow them in an 
automatic fashion (maybe with 'ketchup' or similar).

Please send me suggestions/patches for more things to check up. I don't 
really mind if the scans take a while (also, will let them stay in, even 
after all occurrences has been fixed, in the case they will occur again).
Will let it automatically scan the tree once every week, unless 
requested to do it more often (or just on the subsystem of interest, for 
easier use).

If there is any security issues on the server, please let me know. ;)

Richard Knutsson

