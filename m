From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 May 2005 18:53:08 +0000
Subject: Re: [KJ] [PATCH] Update for the KJ FAQ
Message-Id: <20050519185308.GC3851@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
List-Id: <kernel-janitors.vger.kernel.org>
References: <e3b7bac05051908155489a230@mail.gmail.com>
In-Reply-To: <e3b7bac05051908155489a230@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19/05/05 08:15 -0700, Travis Spencer wrote:
> I just sent in my first patch.  As you probably all noticed, I used
> the wrong patch level and my tabs were swallowed up when I copied and
> pasted from my terminal.  domen suggested on irc that I send my
> patched to patch-tester@coderock.org first because it will find little
> mistakes like this.  I added a blurb about this to the FAQ found at
> http://janitor.kernelnewbies.org/faq and attached the patch.

Thanks, faq updated.

Little about the script behind this:
Idea is stolen from kernel mentors mailing list, from Randy Dunlap,
I believe, who made a similar script.

It works for me (TM), but it sure could use more testing.

If anyone wonders about the code, it's attached.

--jRHKVT23PllUwdXP
Content-Type: application/x-perl
Content-Disposition: attachment; filename="patch-tester.pl"
Content-Transfer-Encoding: quoted-printable

#!/usr/bin/perl=0A=0A# checks for:=0A# - [patch] in subject=0A# - encoding =
(no base64, quoted-printable)=0A# - presence of Signed-off-by=0A# - looks -=
p1 appliable?=0A# - "hi/hello/description" strings=0A# - line wrapping=0A# =
- trailing whitespace=0A# - no tabs=0A=0A=0A$header =3D 2;=0A$body =3D 0;=
=0A$warnings =3D 0;=0A$tabcount =3D 0;=0A$signedoffby =3D 0;=0A=0A# update =
this when needed=0A$kroot =3D "(CREDITS|MAINTAINERS|Makefile|README|REPORTI=
NG-BUGS|".=0A	"Documentation\/|arch\/|crypto\/|drivers\/|fs\/|include\/|ini=
t\/|".=0A	"ipc\/|kernel\/|lib\/|mm\/|net\/|scripts\/|security\/|sound\/|usr=
\/)";=0A=0Awhile (<>) {=0A	# skip the first line, there's probably a better=
 way=0A	if ($header =3D=3D 2) {=0A		$header =3D 1;=0A		next;=0A	}=0A=0A	# h=
eader checks=0A	if ($header =3D=3D 1) {=0A		$header =3D 0 if (!/^[a-z\-]+:|=
^[\t ]+/i);=0A		$boundary =3D $1 if (/boundary=3D"([^"]+)"/);=0A		print("To=
:$1\n") if (/^From:(.*)$/i);=0A		print("Subject: [Checked] $1\n") if (/^Sub=
ject: (.*)$/i);=0A=0A		if (/^Subject: (?!.*?\[.*?patch.*?\])/i) {=0A			prin=
t("\nNo [PATCH] in Subject line\n\n");=0A			$warnings++;=0A		}=0A		next;=0A=
	}=0A=0A	$in_boundary =3D 1 if ($boundary && /^--\Q$boundary\E/);=0A	$in_bo=
undary =3D 0 if (/^$/); # hmm... do boundaries always end like this?=0A=0A	=
# don't print boundaries=0A	print("> $_") if ($in_boundary !=3D 1);=0A=0A	i=
f (/^Content-Transfer-Encoding: (quoted-printable|base64)/) {=0A		print("> =
$_\nTeach your mailer not to encode messages.\n\n");=0A		goto err_out;=0A	}=
=0A=0A	# no checks inside boundaries=0A	next if ($in_boundary =3D=3D 1);=0A=
=0A	# between header and patch, description=0A	if ($body !=3D 1) {=0A		$sig=
nedoffby =3D 1 if (/^Signed-off-by:.*<.*\@.*>$/);=0A=0A		# --- is end of bo=
dy marker, but there might be diffstat so +++=0A		if (/^\+\+\+ /) {=0A			$b=
ody =3D 1;=0A			if ($signedoffby =3D=3D 0) {=0A				print("\nThere should be=
 a Signed-off-by:\n\n");=0A				$warnings++;=0A			}=0A		}=0A		if (/^(\+\+\+|=
---) (?![^\/]+\/$kroot|\/dev\/null)/) {=0A			print("\nPatch should be -p1 a=
ppliable.\n\n");=0A			$warnings++;=0A		}=0A		if (/^ *[hH](i|ello)( +\w+)? *=
[,\.\!]? *$/) {=0A			print("\nHi/hello in patch description.\n\n");=0A			$w=
arnings++;=0A		}=0A		if (/^ *[dD]escription *:\s*/) {=0A			print("\n\"Descr=
iption\" in patch description.\n\n");=0A			$warnings++;=0A		}=0A		if (/^-- =
$/) {=0A			print("\nPlease, no .sig in patch description.\n\n");=0A			$warn=
ings++;=0A		}=0A	} else {=0A	# patch=0A		if (!/^([+\- @]|$|diff)/) {=0A			p=
rint("\nLooks like a wrapped line.\n\n");=0A			$warnings++;=0A		}=0A		if (/=
^\+.*[\t ]$/) {=0A			print("\nYou add trailing whitespace.\n\n");=0A			$war=
nings++;=0A		}=0A		if (/\t/) {=0A			$tabcount++;=0A		}=0A	}=0A}=0A=0Aif ($t=
abcount =3D=3D 0) {=0A	print("\nNo tabs detected... this might be ok, but i=
s usualy error\n" .=0A			"  caused by copy&paste from terminal\n\n");=0A	$w=
arnings++;=0A}=0A=0Aif ($warnings !=3D 0) {=0A	print("\n$warnings warnings =
to work on... good luck\n\n");=0A} else {=0A	print("\nPatch seems OK\n\n");=
=0A}=0A=0Aerr_out:=0A#print("If you think output is invalid, mail <domen\@c=
oderock.org>\n");=0A
--jRHKVT23PllUwdXP
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--jRHKVT23PllUwdXP--
