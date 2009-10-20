From: =?ISO-8859-1?Q?=22L=2E_Alberto_Gim=E9nez=22?=
Date: Tue, 20 Oct 2009 22:02:17 +0000
Subject: Re: Fix sparse warning
Message-Id: <4ADE3369.3010005@sysvalve.homelinux.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4ADCD559.9080807@sysvalve.homelinux.net>
In-Reply-To: <4ADCD559.9080807@sysvalve.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Matthew Wilcox wrote:
> On Mon, Oct 19, 2009 at 11:08:41PM +0200, "L. Alberto Gim??nez" wrote:

> I think in this particular case, there's no reason for 'boot_trace_call'
> to have file-level scope.  I would move it inside the do_one_initcall()
> function (and I'd do the same with msgbuf and boot_trace_ret too).

Matthew, Walter, thanks for your reply.

The static (file-scope) variable was introduced by Ingo Molnar in commit
4a683bf9.

It seems that originally those three static variables were local
variables, what turned out to cause a stack overflow. So, I think they
will stay just like they are right now :) (thank god we have git-blame).

Instead, I'll try to work on renaming the "offending" local variables
and cleaning file by file sparse warnings.


Best regards,
--=20
L. Alberto Gim=E9nez
GnuPG key ID 0x3BAABDE1
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
