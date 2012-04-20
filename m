From: Kees Cook <keescook@chromium.org>
Date: Fri, 20 Apr 2012 17:58:34 +0000
Subject: Re: [patch] Yama: remove an unused variable
Message-Id: <CAGXu5jKVxQMokO4R-td1-+VCRXSFNuqv1eKKQ5Z1vH9arZPQ_Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420133524.GC26339@elgon.mountain>
In-Reply-To: <20120420133524.GC26339@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Apr 20, 2012 at 6:35 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> GCC complains that we don't use "one" any more after 389da25f93 "Yama:
> add additional ptrace scopes".
>
> security/yama/yama_lsm.c:322:12: warning: =91one=92 defined but not used
> =A0 =A0 =A0 =A0[-Wunused-variable]
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Kees Cook <keescook@chromium.org>

Thanks for catching that! I was still building with another set of
patches that used it. Whoops! :)

-Kees

--=20
Kees Cook
Chrome OS Security
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
