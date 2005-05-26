From: Kirk True <kernel@kirkandsheila.com>
Date: Thu, 26 May 2005 06:22:37 +0000
Subject: Re: [KJ] [PATCH V2] Check return code for IBM Olympic /proc entry
Message-Id: <1117088557.3639.4.camel@itchy.kirkandsheila.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88912867532349305=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1116404511.1169.15.camel@itchy.kirkandsheila.com>
In-Reply-To: <1116404511.1169.15.camel@itchy.kirkandsheila.com>
To: kernel-janitors@vger.kernel.org

--===============88912867532349305==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Domen,

On Wed, 2005-05-25 at 15:07 +0200, Domen Puncer wrote:
> On 18/05/05 01:21 -0700, Kirk True wrote:
> > The IBM Olympic driver assumes that the call to create_proc_read_entry 
> > always succeeds. This patch simply logs appropriately whether in 
> > actuality it was created or not.
> > 
> > This falls under the 'Audit return codes (and handle failure correctly) 
> > for create_proc_*()' item on the TODO list. Also added KERN_* constants
> > as per Christophe Lucas' recommendation.
> > 
> >         Signed-off-by: Kirk True <kirk@kirkandsheila.com>
>   ^^ please don't

Sorry to be daft, but "please don't" do what exactly? I tried to follow
the guidelines. My apologies in advance for the error.

> > 
> > --- linux-2.6.12-rc4-kj/drivers/net/tokenring/olympic.c	2005-05-17 23:31:14.000000000 -0700
> > +++ linux-2.6.12-rc4-kj-debug/drivers/net/tokenring/olympic.c	2005-05-18 01:11:00.000000000 -0700
> > @@ -267,11 +267,16 @@ static int __devinit olympic_probe(struc
> >  	register_netdev(dev) ; 
> >  	printk("Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
> >  	if (olympic_priv->olympic_network_monitor) { /* Must go after register_netdev as we need the device name */ 
> > +		struct proc_dir_entry *proc_dir_entry;
> >  		char proc_name[20] ; 
> >  		strcpy(proc_name,"net/olympic_") ; 
> >  		strcat(proc_name,dev->name) ; 
> > -		create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ; 
> > -		printk("Olympic: Network Monitor information: /proc/%s\n",proc_name); 
> > +		proc_dir_entry = create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ; 
> 
> I removed the unneeded (void*) cast (couldn't resist) and trailing
> whitespace here.

I didn't do too much beyond the specific request to handle the audit
code. I'm coming from the 'try to change it as little as possible
because you don't know what you're doing just yet' mindset :)

Thanks,
Kirk


--===============88912867532349305==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88912867532349305==--
