From: Domen Puncer <domen@coderock.org>
Date: Thu, 26 May 2005 06:34:37 +0000
Subject: Re: [KJ] [PATCH V2] Check return code for IBM Olympic /proc entry
Message-Id: <20050526063437.GJ3851@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56111717226285984=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1116404511.1169.15.camel@itchy.kirkandsheila.com>
In-Reply-To: <1116404511.1169.15.camel@itchy.kirkandsheila.com>
To: kernel-janitors@vger.kernel.org

--===============56111717226285984==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 25/05/05 23:22 -0700, Kirk True wrote:
> Hi Domen,
> 
> On Wed, 2005-05-25 at 15:07 +0200, Domen Puncer wrote:
> > On 18/05/05 01:21 -0700, Kirk True wrote:
> > > The IBM Olympic driver assumes that the call to create_proc_read_entry 
> > > always succeeds. This patch simply logs appropriately whether in 
> > > actuality it was created or not.
> > > 
> > > This falls under the 'Audit return codes (and handle failure correctly) 
> > > for create_proc_*()' item on the TODO list. Also added KERN_* constants
> > > as per Christophe Lucas' recommendation.
> > > 
> > >         Signed-off-by: Kirk True <kirk@kirkandsheila.com>
> >   ^^ please don't
> 
> Sorry to be daft, but "please don't" do what exactly? I tried to follow
> the guidelines. My apologies in advance for the error.

Put spaces before "Signed-off-by" :-)
Now that check SubmittingPatches, I see it's there too.
Still, most of patches don't do it, and I imagine it can break scripts.

> > > -		create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ; 
> > > -		printk("Olympic: Network Monitor information: /proc/%s\n",proc_name); 
> > > +		proc_dir_entry = create_proc_read_entry(proc_name,0,NULL,olympic_proc_info,(void *)dev) ; 
> > 
> > I removed the unneeded (void*) cast (couldn't resist) and trailing
> > whitespace here.
> 
> I didn't do too much beyond the specific request to handle the audit
> code. I'm coming from the 'try to change it as little as possible
> because you don't know what you're doing just yet' mindset :)

Well... stripping trailing whitespace is not too much to ask.
Anyway, patch should be in next -kj. Thanks.


	Domen

--===============56111717226285984==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56111717226285984==--
