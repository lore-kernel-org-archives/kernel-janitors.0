From: Christopher =?ISO-8859-1?Q?D=EDaz?= Riveros <chrisadr@gentoo.org>
Date: Thu, 18 Jan 2018 23:33:27 +0000
Subject: Re: [PATCH-next] init/main.c: make local symbol static
Message-Id: <1516318407.2510.76.camel@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118220629.25116-1-chrisadr@gentoo.org>
         <9f473c55-7304-dda3-dea4-2734292927a6@infradead.org>
         <30828c91-a39d-6342-2774-32386baa30b6@amd.com>
In-Reply-To: <30828c91-a39d-6342-2774-32386baa30b6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tom Lendacky <thomas.lendacky@amd.com>, Randy Dunlap <rdunlap@infradead.org>, mingo@kernel.org, akpm@linux-foundation.org, tglx@linutronix.de, keescook@chromium.org, lauraa@codeaurora.org, rostedt@goodmis.org, mhocko@suse.com, tal.shorer@gmail.com, viresh.kumar@linaro.org, lokeshvutla@ti.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

El jue, 18-01-2018 a las 16:31 -0600, Tom Lendacky escribió:
> On 1/18/2018 4:09 PM, Randy Dunlap wrote:
> > On 01/18/2018 02:06 PM, Christopher Díaz Riveros wrote:
> > > Fixes the following sparse warning:
> > > 
> > > init/main.c:167:12: warning:
> > >   symbol 'envp_init' was not declared. Should it be static?
> > > 
> > > Signed-off-by: Christopher Díaz Riveros <chrisadr@gentoo.org>
> > 
> > Does the kernel build OK after this change?
> > 

I built it a couple of times before sending the patch, now I compiled
it again and everything went ok.

> > What about the other user(s) of envp_init?
> 
> It looks like it's referenced in init/do_mounts_initrd.c.  Rather
> than making it static, it should be declared in .h file.
> 

Ok, I'll try to figure it out, akpm accepted the patch in mm-next but
was dropped because of testing failures. I'm still very new to all of
this process.

> Thanks,
> Tom
> 

Thank you both.
> > 
> > 
> > > ---
> > >  init/main.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/init/main.c b/init/main.c
> > > index a8100b954839..ae86addb306c 100644
> > > --- a/init/main.c
> > > +++ b/init/main.c
> > > @@ -164,7 +164,7 @@ static int __init set_reset_devices(char
> > > *str)
> > >  __setup("reset_devices", set_reset_devices);
> > >  
> > >  static const char *argv_init[MAX_INIT_ARGS+2] = { "init", NULL,
> > > };
> > > -const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/",
> > > "TERM=linux", NULL, };
> > > +static const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/",
> > > "TERM=linux", NULL, };
> > >  static const char *panic_later, *panic_param;
> > >  
> > >  extern const struct obs_kernel_param __setup_start[],
> > > __setup_end[];
> > > 
> > 
> > 
-- 
Christopher Díaz Riveros
Gentoo Linux Developer
GPG Fingerprint: E517 5ECB 8152 98E4 FEBC  2BAA 4DBB D10F 0FDD 2547
