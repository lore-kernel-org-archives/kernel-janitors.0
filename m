From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 22 Mar 2010 12:30:22 +0000
Subject: Re: [patch] pxa168fb: use resource_size()
Message-Id: <f17812d71003220530p7c45fbd4r6938433d379bc67@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322121034.GI21571@bicker>
In-Reply-To: <20100322121034.GI21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Jun Nie <njun@marvell.com>, Eric Miao <eric.y.miao@gmail.com>, Lennert Buytenhek <buytenh@marvell.com>, Krzysztof Helt <krzysztof.h1@wp.pl>, Kevin Liu <kliu5@marvell.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 22, 2010 at 8:10 PM, Dan Carpenter <error27@gmail.com> wrote:
> The size calculation is not correct. =C2=A0It should be end - start + 1.
> Use resource_size() to caculate it.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied to 'fix'.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
