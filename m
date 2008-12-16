From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 16 Dec 2008 16:01:38 +0000
Subject: Re: [PATCH] HID: avoid sparse warning in HID_COMPAT_LOAD_DRIVER
Message-Id: <alpine.LNX.1.10.0812161659580.21089@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4947a48f.08b6660a.34ca.ffffa1e8@mx.google.com> <20081216155822.GD12431@fluff.org.uk>
In-Reply-To: <20081216155822.GD12431@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Dooks <ben-linux@fluff.org>
Cc: Hannes Eder <hannes@hanneseder.net>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 16 Dec 2008, Ben Dooks wrote:

> >  #ifdef CONFIG_HID_COMPAT
> >  #define HID_COMPAT_LOAD_DRIVER(name)	\
> > +/* prototype to avoid sparse warning */	\
> > +extern void hid_compat_##name(void);	\
> >  void hid_compat_##name(void) { }	\
> surely this could simply be changed to 'static void 
> hid_compat_##name(void)' if it is only being defined to be an empty 

This will cause gcc emit warnings about unused symbols.

-- 
Jiri Kosina
SUSE Labs
