From: David Miller <davem@davemloft.net>
Date: Sun, 21 Aug 2016 02:12:33 +0000
Subject: Re: [PATCH] wan-cosa: Use memdup_user() rather than duplicating its implementation
Message-Id: <20160820.191233.1040358497240261402.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d335025-5f52-d4b6-0b60-89a2fd354694@users.sourceforge.net>
        <np956e$tnp$1@blaine.gmane.org>
In-Reply-To: <np956e$tnp$1@blaine.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: christophe.jaillet@wanadoo.fr
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 20 Aug 2016 10:42:54 +0200

> Le 20/08/2016 =E0 10:25, SF Markus Elfring a =E9crit :
>> @@ -875,16 +875,10 @@ static ssize_t cosa_write(struct file *file,
>>   	if (count > COSA_MTU)
>>   		count =3D COSA_MTU;
>>   =09
>> -	/* Allocate the buffer */
>> -	kbuf =3D kmalloc(count, GFP_KERNEL|GFP_DMA);
> In this case, 'memdup_user()' has a different meaning, as GFP_DMA will
> no more be used for this memory allocation.

Agreed, this transformation is not equivalent.

Markus, please do not make these changes so blindly.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
