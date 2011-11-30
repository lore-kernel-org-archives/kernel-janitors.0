From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 30 Nov 2011 09:00:17 +0000
Subject: Re: [patch] Staging: line6: NULL dereference in dev_err()
Message-Id: <CAJSP0QWpm8xXfkNG=f7ex2ByqT1HgU_uMUg9ja6oggndZxDn5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111130084341.GC6268@elgon.mountain>
In-Reply-To: <20111130084341.GC6268@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Nov 30, 2011 at 8:43 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> "line6" hasn't been set at this point and we should be using
> &interface->dev instead.
>
> Gcc would have complained about this if it weren't for the fact that we
> initialized line6 to NULL. =A0I removed the initialization.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
