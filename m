From: Matthew Wilcox <willy@debian.org>
Date: Fri, 23 Jul 2004 01:04:03 +0000
Subject: Re: [Kernel-janitors] [PATCH] ieee/sbp2: replace schedule_timeout()
Message-Id: <20040723010403.GC8730@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53727054729155999=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040722223527.GV2165@us.ibm.com>
In-Reply-To: <20040722223527.GV2165@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============53727054729155999==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2004 at 07:26:53PM -0400, Ben Collins wrote:
> Doesn't msleep() block? If so, that's not what we want at all. We want
> other things to happen during that time (like maybe catch a bus reset).

No, msleep sleeps (as its name suggests).  The code that implements it is:

void msleep(unsigned int msecs)
{
        unsigned long timeout = msecs_to_jiffies(msecs);

        while (timeout) {
                set_current_state(TASK_UNINTERRUPTIBLE);
                timeout = schedule_timeout(timeout);
        }
}

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============53727054729155999==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53727054729155999==--
