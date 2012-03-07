From: =?ISO-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>
Date: Wed, 07 Mar 2012 04:01:58 +0000
Subject: Re: [PATCH 2/2 v2] Staging:android: Initialise buffer and buffer_size before used
Message-Id: <CAMP5XgfWBj_V+21avHyEbViYK1N0fHBmyj6CcYry0Fd4QttgqQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331087818-9942-1-git-send-email-ruan.zhengwang@gmail.com>
	<1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1331087818-9942-2-git-send-email-ruan.zhengwang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Zhengwang Ruan <ruan.zhengwang@gmail.com>
Cc: gregkh@linuxfoundation.org, chris+android@zenthought.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 6, 2012 at 6:36 PM, Zhengwang Ruan <ruan.zhengwang@gmail.com> w=
rote:
> GCC warns 'buffer' and 'buffer_size' are used with being uninitialized, a=
nd
> 'buffer' is used as returned value, and 'buffer_size' is initialized using
> uninitialized_var to clear warning.

Why do you clear the warning on buffer_size with uninitialized_var()
but not on buffer? Neither variable is used before being initialized.

--=20
Arve Hj=F8nnev=E5g
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
