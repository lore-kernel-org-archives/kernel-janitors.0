From: Eric Anholt <eric@anholt.net>
Date: Fri, 19 May 2017 18:19:03 +0000
Subject: Re: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <87mva8g160.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519110203.19417-1-colin.king@canonical.com>
 <874lwhoxyk.fsf@intel.com>
In-Reply-To: <874lwhoxyk.fsf@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Colin King <colin.king@canonical.com>, Tom Cooksey <tom.cooksey@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Fri, 19 May 2017, Colin King <colin.king@canonical.com> wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> structure pl111_display_funcs can be made static as it does not need to be
>> in global scope.  Fixes sparse warning:
>>
>> "warning: symbol 'pl111_display_funcs' was not declared. Should it
>> be static?"
>>
>> Fixes: bed41005e6174d ("drm/pl111: Initial drm/kms driver for pl111")
>
> The patch looks good and I appreciate what you're doing, but I question
> the usefulness of adding Fixes: tags for trivial stuff like this. I'd
> prefer Fixes: was reserved for actual fixes that should be backported to
> any kernels that have the commit being fixed.

Agreed -- since Fixes implies going to stable, we don't want it on
non-stable-candidates like this.  Reviewed these two and will push
without the tag in a moment.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkfNxcACgkQtdYpNtH8
nuh+QA//XRAM/UjbQq1trHbNl8OKrFlUYbFdTyQET9P5bWxYJnjK1bEPTht2/8f4
/aTWV1NQOqwaqqxOWbbc5c3CCoHvLRwmvGkLHEGQqkxfc/rQtuNWWDgJZdJXC1cU
jRB5Ftk/fx+ORyOOAPdIUh3/WjCOkqqeAf1MMLbEnaj8+YGQP1lCH7SX5zRlssbz
ueYLSH5j9lOvzK7NQ9bovayo1NepF3Bnsi3AFPNqeaDsLFwdi2BrGkDRdCYEVkUB
468lLLSkhn1xvC3lQ+P40I3FKbXt4Lm+sLSzh6dDT5fOzJAzOuoHzfnAXT/vc99D
oPoV/XmfhlkIJ4MbHcHe6Qti1MZa87uLqpGmjNtSUxzNUlticHigx3aSd/cOmUuY
LCuqGFk+o9CFfuWaMMuIs388Gb9Yo4A+rhSe8NXUnOxMnTNYt8cYEYZdF16SP8Gh
EVqTV1ZPtnFMtWtrlWSYgQexaF6ZcTn907zvvQnp4vL5wYNhFjcf5HqvDWFn9k/I
O0QUYRdEQHagmbN/29la2v5GhAeqTbLRom0+85cmLh4VqRYegoXWHWEWjMb9QHFU
JbZO8Vh2wZ9WXcWjdERvZv9Q42Gx+GkfZPkwj+BXWF8C+/cpXIRBUNkwj3cqibKp
Fyml86wbYOSdMIVNqy0A3XNy/o0Z8bQ+Io8Dv8dahl79r7BNTic=
=AENn
-----END PGP SIGNATURE-----
--=-=-=--
