From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 13 Jun 2012 18:30:57 +0000
Subject: Re: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <CALF0-+V3qrh-fpTJb9nn76puB6X7fR7+HVdGK47QU07YY2x0kQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
In-Reply-To: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jun 13, 2012 at 3:21 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
>
> It returns a pointer to the first non whitespace character, but you
> can just ignore the return value. =A0Normally the first character is
> going to be non whitespace, so it's not even a slow down.
>

Got it. I guess when you say there is no performance impact,
it's because this kind of functionality is used very sparsely in the code.
(Please correct me if I'm wrong.)

Thanks,
Ezequiel.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
