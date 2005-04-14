From: Domen Puncer <domen@coderock.org>
Date: Thu, 14 Apr 2005 23:07:37 +0000
Subject: [KJ] faq and tips
Message-Id: <20050414230737.GB3983@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85387416792217308=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85387416792217308==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Maybe this will be useful to somebody.
Comments, updates, fixes?



Kernel Janitors FAQ

Q: What is Kernel Janitors?
A: It is a project to help wannabe kernel hackers get their feet wet
   while doing something useful for the community.

Q: What will I be doing?
A: Basically, cleaning up the kernel.
   You can look at TODO for some example tasks.

Q: Prerequisites?
A: Knowledge of C, being able to compile and boot Linux kernel.

Q: What documents should i read?
A: SubmittingPatches, CodingStyle from Documentation/ .
   http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt
   and http://linux.yyz.us/patch-format.html are good to read also.

Q: Where should I send patches to?
A: Mailing list: kernel-janitors@lists.osdl.org
   If you feel confident enough, you can CC: someone from MAINTAINERS too.

Q: Where can I find janitors?
A: On our mailing list and #kerneljanitor at irc.oftc.net

Q: I got some negative replies. Am I just wasting peoples' time?
A: A nice motivational post from Linus: http://lkml.org/lkml/2004/12/20/255


Mailer problems
---------------
Q: What is prefered way of sending patches?
A: Inline (Insert file or similar, copy & paste is _not_ ok).
   If that's not possible, plain text attachment (no base64, quoted
   string or, tux forbid, html).

Q: What do I need to set in my e-mail client?
A: Disable line wrap, and see upper FAQ.

Q: How do I test my settings are ok?
A: Send patch to yourself, save it, try applying it. If it works it's ok.


Some tips
---------
Use cscope or ctags for finding functions.
ketchup [1] is very useful for keeping up to date kernels.
Also for managing lots of patches you might find patch-scripts[2] or quilt[3]
useful.
  [1] http://www.selenic.com/ketchup/
  [2] http://www.zip.com.au/~akpm/linux/patches/patch-scripts-0.18/
  [3] http://savannah.nongnu.org/projects/quilt

When diffing more files (especially in different directories), linked trees
(cp -al) are useful as they will work much faster; patch already knows
that is should break hardlinks; vim can be taught by setting
"set backupcopy=auto,breakhardlink" in your ~/.vimrc .
Example usage:
  ketchup 2.6.12
  cp -al linux-2.6.12 mytree
  # change some random files in mytree/
  diff -pruNX Documentation/dontdiff linux-2.6.12 mytree > my_new_patch


Since typing Signed-off-by gets boring, here's a ~/.vimrc sample:
 map <F1> ^iSigned-off-by: Random C Developer <rcd@example.com><CR><ESC>^
 map! <F1> Signed-off-by: Random C Developer <rcd@example.com><CR>

Trailing whitespace:
After you put this in ~/.vimrc it will be hard to not fix it:
 highlight WhitespaceEOL ctermbg=red guibg=red
 match WhitespaceEOL /\s\+$/

--===============85387416792217308==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85387416792217308==--
