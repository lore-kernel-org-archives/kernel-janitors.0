From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Mar 2013 10:56:41 +0000
Subject: Re: [PATCH v3 0/4] Cosmetic changes to the android binder proc release code
Message-Id: <20130312105641.GE9138@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363044388-11409-1-git-send-email-mirsal@mirsal.fr>
 <1363084922-19698-1-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363084922-19698-1-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mirsal Ennaime <mirsal@mirsal.fr>
Cc: Greg Kroah-Hartman <greg@kroah.com>, Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>

On Tue, Mar 12, 2013 at 11:41:58AM +0100, Mirsal Ennaime wrote:
> Changes from v2
>=20
>  * kept arguments aligned with parentesis (Following
>    Arve Hj=F8nnev=E5g's review)
>  * added a fourth patch which removes function names from string litterals
>    in favor __func__ (Following Dan Carpenter's review)

Actually that was Joe.

Looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
