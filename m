From: Andrew Morton <akpm@osdl.org>
Date: Wed, 01 Sep 2004 23:36:49 +0000
Subject: [Kernel-janitors] Re: [patch 21/25] hvc_console: replace
Message-Id: <20040901163649.7e4f1060.akpm@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17894637714352113=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1C2cAg-0007UH-3I@sputnik>
	<20040901153034.35104957.akpm@osdl.org>
	<20040901230840.GG7467@stro.at>
In-Reply-To: <20040901230840.GG7467@stro.at>
To: maximilian attems <janitor@sternwelten.at>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@osdl.org

--===============17894637714352113==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

maximilian attems <janitor@sternwelten.at> wrote:
>
> > janitor@sternwelten.at wrote:
> > >
> > > -#define TIMEOUT		((HZ + 99) / 100)
> > > +#define TIMEOUT		10
> > >  
> > >  static struct tty_driver *hvc_driver;
> > >  static int hvc_offset;
> > > @@ -276,8 +277,7 @@ int khvcd(void *unused)
> > >  			for (i = 0; i < MAX_NR_HVC_CONSOLES; ++i)
> > >  				hvc_poll(i);
> > >  		}
> > > -		set_current_state(TASK_INTERRUPTIBLE);
> > > -		schedule_timeout(TIMEOUT);
> > > +		msleep(TIMEOUT);
> > 
> > This one is wrong: we need to sleep in interruptible state here, otherwise
> > this kernel thread will contribute to the system load average.
> 
> could we add for such cases msleep_interruptible()?

Sure.

Note that you're raising patches against some ancient kernel and that this
particular function has changed.

--===============17894637714352113==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17894637714352113==--
