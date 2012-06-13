From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 13 Jun 2012 18:16:24 +0000
Subject: Re: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <CALF0-+Ub914giBvJB9YFOaCqrNpCG-EE+mfuGxCjncpq1Bpfyg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
In-Reply-To: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Dan,

On Tue, Jun 12, 2012 at 5:58 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> Actually, on second thought strim() already does what we want. =A0Just
> ignore the return value.
>

If I *only* want to remove trailing whitespace, using strim() does the job
but it *also* tries to remove leading whitespace.

That can't hurt, but it also doesn't hurt to add a separate function
for that, right?

Thanks,
Ezequiel.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
