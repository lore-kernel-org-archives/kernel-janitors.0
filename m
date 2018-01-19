From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 19 Jan 2018 00:31:34 +0000
Subject: Re: [PATCH-next] init/main.c: make local symbol static
Message-Id: <20180118193134.59135fde@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180118220629.25116-1-chrisadr@gentoo.org>
        <9f473c55-7304-dda3-dea4-2734292927a6@infradead.org>
        <30828c91-a39d-6342-2774-32386baa30b6@amd.com>
        <1516318407.2510.76.camel@gentoo.org>
In-Reply-To: <1516318407.2510.76.camel@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christopher =?UTF-8?B?RMOtYXo=?= Riveros <chrisadr@gentoo.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Randy Dunlap <rdunlap@infradead.org>, mingo@kernel.org, akpm@linux-foundation.org, tglx@linutronix.de, keescook@chromium.org, lauraa@codeaurora.org, mhocko@suse.com, tal.shorer@gmail.com, viresh.kumar@linaro.org, lokeshvutla@ti.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 18 Jan 2018 18:33:27 -0500
Christopher D=C3=ADaz Riveros <chrisadr@gentoo.org> wrote:

> > > What about the other user(s) of envp_init? =20
> >=20
> > It looks like it's referenced in init/do_mounts_initrd.c.  Rather
> > than making it static, it should be declared in .h file.
> >  =20
>=20
> Ok, I'll try to figure it out, akpm accepted the patch in mm-next but
> was dropped because of testing failures. I'm still very new to all of
> this process.

Yeah, because do_mounts_initrd.c didn't compile. If you do add it to a
header, use a header local in the init directory. Do not expose
envp_init to the entire kernel.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
