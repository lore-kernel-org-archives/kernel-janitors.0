From: Yoon Soo <yoonsoo@web.de>
Date: Wed, 26 May 2004 20:37:45 +0000
Subject: [Kernel-janitors] introduction and first questions
Message-Id: <40B50019.7040607@web.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50228978098070542=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50228978098070542==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I am new in this list and there are some points which are not very clear 
to me. But first of all, I read the todo list and worked on the point to 
get rid of the 'old-fashioned' way to access the driver_data field 
direct and replaced them with the proper dev_get/set_drvdata or 
pci_get/set_drvdata.

I created the patch like mentioned in the patchsubmitting-howto of the 
source documentation, and have tested it. What are now the further 
steps, just sending the patch as attachement to this list? Another 
question is, which original source code version should be taken..2.6.6 
(as I did) or the most actual from the cvs tree?

Very many thanks in advance for helping me making the first steps ;)

greets

ys

PS. As I have seen while working on my patch, tty->driver_data should 
also not accessed directly, and for the consistency tty_get_drvdata and 
tty_set_drvdata should be added too and called instead of the direct 
access. Is this the right list to discuss this matter? Or is it in work?

--===============50228978098070542==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50228978098070542==--
