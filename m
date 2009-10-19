From: =?UTF-8?B?IkwuIEFsYmVydG8gR2ltw6luZXoi?=
Date: Mon, 19 Oct 2009 21:35:12 +0000
Subject: Fix sparse warning
Message-Id: <4ADCDB90.7030903@sysvalve.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi,

I'm starting to do some cleanup for the project, and I'd like to begin
fixing sparse errors.

By the way, at first glance, it seems that the warnings that sparse
catches may need some depth look (i.e. not a newbiew) not to mess things.

For example, my first compilation sparse checking throws this:


init/main.c:763:13: warning: symbol 'call' shadows an earlier one
init/main.c:710:31: originally declared here
init/main.c:793:13: warning: symbol 'call' shadows an earlier one
init/main.c:710:31: originally declared here

If you take a look at the code, the global "call" variable is defined as:

static struct boot_trace_call call;

And what makes sparse whine is a local variable definition, totally
unrelated (i think):

static void __init do_initcalls(void)
{
    initcall_t *call;

    for (call =3D __early_initcall_end; call < __initcall_end; call++)
        do_one_initcall(*call);

    /* Make sure there is no pending stuff from the initcall sequence */
    flush_scheduled_work();
}

So, it seems that I could "fix" this by changing the local variable
name. The question is: is this _really_ needed apart from "code
hygiene"? Should I "fix" (if you agree to call that "to fix") that issue?

Or would you otherwise recommend me to start with the official janitor
TODO list and address more mechanical work at first? Thanks in advance.


Regards,

--=20
L. Alberto Gim=C3=A9nez
GnuPG key ID 0x3BAABDE1
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
