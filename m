From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Date: Wed, 02 Feb 2005 19:50:53 +0000
Subject: [KJ] Re: [PATCH 9/20] w1/w1: remove interruptible_sleep_on_timeout()
Message-Id: <20050202225053.2354277e@zanzibar.2ka.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12681567441191999=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12681567441191999==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Feb 2005 11:14:18 -0800
Nishanth Aravamudan <nacc@us.ibm.com> wrote:

> Hello,

Hello.
 
> Please consider applying.
> 
> Description: Replace deprecated interruptible_sleep_on_timeout() with direct
> wait-queue usage. Ideally, I would use wait_event_interruptible_timeout();
> however, there is no condition to sleep on here, unless I was to use the
> try_to_freeze() call as one. That is not the case in the current code, though,
> and I'm not sure it can/should be. Since timeout is a jiffies-unit variable,
> change the type to unsigned long. Patch is compile-tested.

Second part of the patch(changing w1_process() sleeping path) is not 100% right.
Although all those sleeps are just waitings for given timeout to check various
flags - since awakening only happens on signal, we can just replace them
with msleep_interruptible() and appropriate try_to_freeze().

I will prepare a patch tomorrow, thank you.

> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


	Evgeniy Polyakov

Only failure makes us experts. -- Theo de Raadt

--===============12681567441191999==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12681567441191999==--
