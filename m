From: Scott Murray <scottm@somanetworks.com>
Date: Tue, 27 Jul 2004 22:04:19 +0000
Subject: [Kernel-janitors] Re: [PATCH] pci/cpci_hotplug_core: replace
Message-Id: <Pine.LNX.4.58.0407271755360.26002@rancor.yyz.somanetworks.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87385881431364298=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87385881431364298==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 27 Jul 2004, Nishanth Aravamudan wrote:

> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch. 

msleep sets TASK_UNINTERRUPTIBLE and not TASK_INTERRUPTIBLE, which I think 
will work okay in this instance, but am not actually sure.  I'm leaving 
for two weeks vacation tomorrow, so I'm not in a position to test this out 
at the moment.  Greg, can you comment on the correctness of this?

My only other comment is that I would prefer you keep the braces in the 
if/else statements.  There may only be one actual line of code in the 
bodies, but with a comment above that one line I find it looks odd.  

Scott


-- 
Scott Murray
SOMA Networks, Inc.
Toronto, Ontario
e-mail: scottm@somanetworks.com

--===============87385881431364298==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87385881431364298==--
