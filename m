From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 24 Sep 2004 18:33:11 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 28/38] net/pcnet32: replace
Message-Id: <20040924183311.GE16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97873434176930663=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040924180825.GH1757@us.ibm.com>
In-Reply-To: <20040924180825.GH1757@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============97873434176930663==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 07:21:13PM +0100, Matthew Wilcox wrote:
> Surely that needs to be:
> 
> 	if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / 1000))
> 		data = (u32)(MAX_SCHEDULE_TIMEOUT / 1000)
> 	msleep_interruptible(data * 1000);
> 
> (and actually, this should be pulled into net/core/ethtool.c out of each
> driver).

A little further thought ...

unsigned long msleep_interruptible(unsigned int msecs)
{
       unsigned long timeout = msecs_to_jiffies(msecs);

       while (timeout && !signal_pending(current)) {
               set_current_state(TASK_INTERRUPTIBLE);
               timeout = schedule_timeout(timeout);
       }
       return jiffies_to_msecs(timeout);
}

There's no guarantee that there is a value in ms that converts to
MAX_SCHEDULE_TIMEOUT.  Do we need an MSEC_SCHEDULE_TIMEOUT so we can
do something like:

unsigned long msleep_interruptible(unsigned int msecs)
{
       unsigned long timeout = (msecs == MSEC_SCHEDULE_TIMEOUT) ?
		MAX_SCHEDULE_TIMEOUT : msecs_to_jiffies(msecs);
	...
}

I'd be loathe to put this in the msec_to_jiffies macro itself since it
isn't always used in an appropriate way...

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============97873434176930663==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97873434176930663==--
