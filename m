From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 01 Sep 2004 23:08:40 +0000
Subject: [Kernel-janitors] Re: [patch 21/25] hvc_console: replace
Message-Id: <20040901230840.GG7467@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============087065319057612944=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1C2cAg-0007UH-3I@sputnik> <20040901153034.35104957.akpm@osdl.org>
In-Reply-To: <20040901153034.35104957.akpm@osdl.org>
To: Andrew Morton <akpm@osdl.org>
Cc: linux-kernel@vger.kernel.org, kj <kernel-janitors@osdl.org>

--===============087065319057612944==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 01 Sep 2004, Andrew Morton wrote:

> janitor@sternwelten.at wrote:
> >
> > -#define TIMEOUT		((HZ + 99) / 100)
> > +#define TIMEOUT		10
> >  
> >  static struct tty_driver *hvc_driver;
> >  static int hvc_offset;
> > @@ -276,8 +277,7 @@ int khvcd(void *unused)
> >  			for (i = 0; i < MAX_NR_HVC_CONSOLES; ++i)
> >  				hvc_poll(i);
> >  		}
> > -		set_current_state(TASK_INTERRUPTIBLE);
> > -		schedule_timeout(TIMEOUT);
> > +		msleep(TIMEOUT);
> 
> This one is wrong: we need to sleep in interruptible state here, otherwise
> this kernel thread will contribute to the system load average.

could we add for such cases msleep_interruptible()?
patch for that function was sent separately.
 
> Several other of your msleep conversion patches actually fix bugs.  You've
> found drivers which want to sleep for a fixed period, but they do that with
> TASK_INTERRUPTIBLE.  If someone sends the calling process a signal, these
> drivers will end up not sleeping at all and may fail.

i'll instantly queue some more msleep conversions up.
 
> I'll going through these patches and shall apply the ones which look right.
> Please consider them all to have been handled, thanks.

thanks cool :)
 
--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============087065319057612944==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============087065319057612944==--
