From: Matthew Wilcox <willy@debian.org>
Date: Tue, 27 Jul 2004 03:00:52 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/e1000_osdep: replace
Message-Id: <20040727030052.GB6171@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50683856474437983=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727000001.GK1897@us.ibm.com>
In-Reply-To: <20040727000001.GK1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============50683856474437983==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 26, 2004 at 05:00:01PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Replace schedule_timeout() with msleep() to guarantee the
> task delays for the desired time.
>  			} else { \
> -				set_current_state(TASK_UNINTERRUPTIBLE); \
> -				schedule_timeout((x * HZ)/1000 + 2); \
> +				msleep(x); \
>  			} } while(0)

Looks much better than the previous code.  It's actually possible to do
better, though.  Simply change to:

#define msec_delay(x) msleep(x)

If msleep() ends up scheduling, the bad attempt to sleep will be caught
by schedule().  There's no need to do the check in the driver.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============50683856474437983==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50683856474437983==--
