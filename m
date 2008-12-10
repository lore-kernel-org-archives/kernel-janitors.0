From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 10 Dec 2008 19:41:55 +0000
Subject: Re: [PATCHv2 4/9] mISDN: fix sparse warning
Message-Id: <49417296.25e2660a.2824.ffffc60b@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49403C26.5050402@gmail.com>
In-Reply-To: <49403C26.5050402@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Karsten Keil <kkeil@suse.de>

Impact: un-export symbol 'plx_lock'

Fix this warning:

  drivers/isdn/hardware/mISDN/hfcmulti.c:176:1: warning: symbol 'plx_lock' shadows an earlier one
  drivers/isdn/hardware/mISDN/hfcmulti.c:175:19: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---

On Wed, Dec 10, 2008 at 11:01 PM, Jiri Slaby <jirislaby@gmail.com> wrote:
> On 12/10/2008 04:13 PM, Hannes Eder wrote:
>> Should 'plx_lock' be declared in a header file?  Or is it really
>> neccessart to export it?
>
> As there is no other user, I vote for unexporting it.

In that case patch number 4 looks like this:

 drivers/isdn/hardware/mISDN/hfcmulti.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index 599d832..970201d 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -173,7 +173,6 @@ static int interrupt_registered;
 static struct hfc_multi *syncmaster;
 static int plxsd_master; /* if we have a master card (yet) */
 static spinlock_t plx_lock; /* may not acquire other lock inside */
-EXPORT_SYMBOL(plx_lock);
 
 #define	TYP_E1		1
 #define	TYP_4S		4
-- 
1.5.6.3

