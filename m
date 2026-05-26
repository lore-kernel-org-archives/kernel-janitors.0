Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104832DECDF;
	Tue, 26 May 2026 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779822227; cv=none; b=M+z43eSx0pfjdyGIWjYXekCLs7vmvcAQSEMTgB2Cee70spJkvhHV0SO6H9zlXAAwoBxTjQ6QOq9Ll21ol8IwZ2HSQlYm8Gc47jSs0O/jDS2vnUJGrYqpdIEzmqQCDIBGCg1XIjXEduMrwvVzkRMHFlO3RfF5C1j+OetIHlXJj20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779822227; c=relaxed/simple;
	bh=6e1/lgPlad11OGMrWXxb0ge80wdw7/do19W6QjiOoPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WREnMl1d/ev+k0lCUncUeL03nMIOrWrXSyEx4ymj0C4KccHU//fOzUV2WWNWHazjaT7g8wUOByCeWgdU6NtnryQvsrQ0bpjFE1LyBR2NrF/s7b2Dss5VKMNE9MamidTk8JmtoAVozDb73iz9hW9sJvEKCWOJimYauObTxCbG7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WD6DxoE2; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WD6DxoE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779822208; x=1780427008; i=markus.elfring@web.de;
	bh=pcT+meT3TdATB2HRrdep6G2EVsTo8/pInG9nK3kkxZM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WD6DxoE2393Xlhz0/bczxeY3oV4wFQmUNQ0igvzvaorwoy1m94KZexijhUlkdCBX
	 kNY2VfGZvUyb1tdUA+JDuQqn/XUWB0OkhTWURp3DtCnhsbE6i25wfu4uNRJ6VeGcs
	 I+1yPtQDGIrF2pN0Z8TnQmrW6n3aE1jJcoS8VT4o17s4JCV93+jQkXNh5NuhBgyYE
	 pYh/2ePIXu3J2TV2ZdfP/cY1o3ib6IZ9HIAY3+spXE6fBjOM53gafopmsnwbVOkCJ
	 IaZ7XW1aV4cnBysz8W8MIAvxMocp3T9i+aJPtjATfDyZF11Ox20dFBGexoTcJ0Hp+
	 EVzScyOpr8WRyD9/0A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mty5w-1xJd2y1uGK-013nfH; Tue, 26
 May 2026 21:03:28 +0200
Message-ID: <333fe1d1-36eb-4e0c-982d-c9e50f9f78fb@web.de>
Date: Tue, 26 May 2026 21:03:26 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: stratix10-rsu: Fix NULL deref on
 rsu_send_msg() timeout in probe
To: Dinh Nguyen <dinguyen@kernel.org>, kernel-janitors@vger.kernel.org,
 Tze Yee Ng <tze.yee.ng@altera.com>
Cc: stable@kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260526144216.3863269-1-dinguyen@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260526144216.3863269-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TS0/AcdZo6ZHo0P9oim0AQ5GuOQRPkVEHthBzNvJguq2x2UvXHY
 Ntd/FbcAtIlAKDirXdmslKOxWyAhgxt0MkrihISfCbcR99D1/YZgInW4zHaCelv8MzvUf4+
 XoqapW9KFJAncKqeGxzLSOL5qfQPz1HUt9SLvfM8uKguwU5CY/8jc4E94D1tf76jL5t4+o/
 CiV9FgW6XSye7W9pSfwgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xOHe3yHlE2E=;VVYcucypYLmp6B61Xe/pKjF5LbV
 f8ZjxqcfTSqxNLwKB68Dis4oEYI3OtlCgoUyqp7OB4xIPz+Cvvg5OjyUi7dXgrTJQh4PCvPOx
 zCyyQdZoJrRmjUJsSPlSZGB+swpj9XWr2ufxYvoaPPrsiB4+Ekp3q3C61l6VZt9NcB/RnEkqR
 bpk7/oQ2whB3qzfO9a5CjtapuoP22H4mQxMbS8lkR6T4OSQc5+lwqfuX/LZdBnsntjphmfVf5
 teg9Xfjsu1ppd0HZPuF9eu07UpVp+wDYMXtLzqBsl1ZC4ImoiZtsjsgSSw7DIaFFH4lJMLabr
 26kKFQ2LqJHf26J///Wi3Hgzgsq6Wy3US5/GfuKi9auGwotPlGi1bmroqhXHwkyZFoN7VZR0e
 MDm6b2iRQ1rExO4MfX2WJnDH/P6yXV0L+aziaOx7/WN36RI/vhwHHIZn0DhLZnwbW9wpSIVUE
 ezqMQoCqy7pwXBJIqZZPFQbanqDuaqBNp+ZsxUr/FpbLBWwDybqYaPWuGCGV6N8QGGgUZ2EaZ
 7ybEILK3kLaYKkg9P6pzR293LBl3LGaxK4fWbvxx7M6owHZKfDlUP0BRQjq7i0ZCkqZKGd7Oa
 5BBMrMOMwvezOlX7h1ZnN6O8DtryvgIHDPo/PM73lTWqwhgVsXS5AOdCzA8VXHXBQY6d1tQMe
 IH/T5tAD7odLtF9VRfodD4lanEImLNy6vHbsNJNfW1MiAPFT6X1MuKS1IVMR0Se3fIX6OUnG0
 80gE6LUI8i9IG/ViOda7p9jmugWEVb1nSArkkEB+aFK46lRgjI/yKwJ0Ji0WBPo+J3KnImh3m
 TTYkOtQa0kXrvI9eYeUkEDTM90gKQExN3/8zolbU1YfnqD4xSI4bldbUdTbd1NRYRXuKE2UZo
 JNYyl7u9EIM5sQ516zCUqxHHmi6T570ThFPoyC2TmnJjKB9XQTgKWIKCkEQRPp5KGE2V67uwt
 KAtZp+n1Mqx7iGNfV0ETby0YskUfjm7X5ahu4jmkaCh/TvjWqlEJb/OX84f86v+i0VHB4jZ37
 286PwqAXHjf4p9eWbsPZyQHy2LeqPRlQGCrZSqGLDuYRHGIKm5mEGZRy4eznS4rS8vHkf/+o9
 VoctPy5EWHbaiugkuDwV87ZNvCMsRBLZIaGL4G+6gBrPta6F+E47lNnWO9MD9d/ibOsQ9HeIq
 lzwrfKu5EAgPaDMjClF3+QP3mBNFO00AzVArHvg22t2Ho2K5Virn5yymklS8zpEML/hrzgUr5
 15KJ7peGIPxMeJo6X+cCxl8AZ3w/7hxRd1RiiBJ32Q+CZ4Ktj5HXAJyRSll/SISNzpVt1R6IC
 SipuTU5c4xEV+b/9QBM+UmD+Ixv366FHA9EeLlFHtPmsfjUV0MgudrdjlNxzc4i1r5gqEcmsS
 vnDNc/oxXk39vZ5ZV6X2F3c2nfGVAfvI9BxORkLwPfT1hbGHR84rkuvnJ9JWXiGGyRlQLJOUx
 t5ISQ90JbU+OkzJvAXrCgS2E3srDs2Hutn9dS7W9Gla9+PAxE9Qat5vNJrqTbyI/blM/897H+
 bAO0DBkiqUgR9rkpN6cNaZMgTO1ELQX1ox7TUNk6C8wxWEUaHNUQkuYDtE5zoUGjmBRJojGST
 J7dBEu4AQJTGEwxUF4D3SB8nrl+MxIAby8po1R3IQnU8hmBsn9BS3jiZrjGfpr1K3kftjzqJK
 gy+YP4uGIjSOSg58GZZ68OXzIcWz4KsgUCi4SqCNcyS7cq4YlWMCnB01xgfFP6rQWZ3UrtxW0
 wHgWnCwIEUwbmhnnEgDUHuuOPdFa2by74uArnUQuD3UUU3BhwVe1Mz2KNBNrJvq+WtGPtdNa4
 SzHN3k4r5+Ia/ud1Oi92lkSRGOEzNIXJN21PnytmmwOflPs/1Cfo1K4Tz0ZWCl1xX/EUYvGkA
 ku1aFWiOAsGUzmaZal92hqXzKjbHCUIV3cWHucTIy9TnM9ghnEX+VEWrAm8E1QrjUIkPAHOFg
 AetF20pV3Xm/0fReczF7O4k4oHtWMTn6FCWvFpNy5a+bpKL8i1RFFMhwypwXPnr1WkX1gjVIc
 Bm2h8W0eZ984509i7k2LpYY1y0W71lPwqZ2z24/1YOJ2HrMounIn0kO9SFxF2xCEboKweBn7K
 Xs7qWaf76SjW+rGyNrLITgJmWGFDb4BQg/Uk3WwXR7PXuVQlc0Beo2FzDtm5fqYkPI9uVW9hF
 tBbWxT+UM4mrkL/poYfyLV8Hg/mMbldXTAan3cptBwxlTPN663x2HnXxDpUxnQT4bvlm39sk9
 FTaIAIUobQYh7p8nmBs9AFirx9YEHJiEMalmpIeNYz73P6tJKW/76qhTRumyBKZ93CEyX9H/M
 XuCsAsU7jnX39cS0fcjt0VbQWn8Y7yxC4demv2csUJSxAILEwKc9e7l+uP25/6G9iwa6jJyA7
 MegU+A5e4ClPwkN57n9oxuP19qJ1cJmW/4buFKPLTZmklukWoRRsuGr3DCY+04sOSQxl1SDHI
 UPQXrGr4UW9ZmeVwkt6xQenx7PUyB9rv9S4Ux5WN9UxMSjThfPB5Q1/JX+pxz9wSc3yWjHuyf
 KuLx9sHCx7alutdzyURlJ2bMD0daEolvZOB/WPB2W7G13cKoyzdKc4dGvD0WBliZJGoaV8n/V
 7/BFETwqpgRC1cXZCzgo6x+dx9xjZ9VjYQ6gH1VRwIKIizYy55xzQJ8lSAnWuyykULVFfze44
 fRJeWeSFyE5uC8rwjtXewa7eDc44VzK9Yq+eMdk+oAgc37uKoOBJ6NP2eIS8HBtounwbY/INs
 JYh2PlFWVPVbR+PImjK4YRJ4FHFsZnIE8NlcV8BPqF+AH+1uQY8xXFkdO4L0lhl06sqAz2F5D
 eORXJdDFAeBqR1yYEnjOr7lga24Qyd9voUd5E6zKuk9TPPshxjJyS+6ScHNgLRLZ4AbGTp+rQ
 TQokx6FVxQPhgSU2IlC/Ow/w5FIagaxVFO1qiZ/yMQLV0sz4CICNKZzwj+mHkrveT8zjTQ5NY
 9RhBekkNd0Y/PMBBRfZ2QoUw09FhjepKsK/BRUkABssuWhlucEoq2vfQoP4xkFNQLy4BkP6Lh
 q3ri2wgWSB8U6FVKiUVwyN5RVJR+mlq31Pn3J1Qx/ZVIy61p62i4M/jJ2/WBqjbPO/3DA7iqn
 3+ofp/c6su/z7ToVQBGxzjvkh0vbCAOs3RZfuecPRSk0ktB2hvOMdp9y0U+wvFTrXYS+htvfC
 qfs+jx0Ery0Fb5YVT8fobTfd9jXozPCpIFZThkNZZutm5PI/CPmzzTq7uMtkchOqsYAHyfwEp
 tK3ovDKGMz10CMOdMcYdXWhw1lWdGcZeaLOGoi7D7PMo9ICzTqjlzwtDvOwxvVV6TJJn87hNt
 de3xDzsbphxUdHnOW5zuG2p1ABrH0j2y+LVpr+5rOUsMaxdSUrmgATz14ZCUPSU/UiMyBZKa1
 QW0loBS3FWplBMUlb59xAzVY3TsWACTr6SEf2QZLgorbciG9UhgpaxOOt90tNaBY7j/52U8Gf
 Cm5Anjx/lXNb+lrWs4ZCuAVklXuw4hLLNHDs8w1ZYRgIY1cnB3uU2FvyEnMK8ziTyOvw3bd0R
 hQatKUjUSiynarlzRIpun0+Oz0i465JTojYmzeOLbPFNlgY6J7WDKPmoiflEJP0GR52wiLUB4
 /yc9xVUptk1UvZjQhQ9p58lDNLdwgPK1kjjZ0UjGNQbmOV9SigcveL2PoBwGv836F2Xg9e1qg
 O3hLIt9CmZbFNvEipy/LIWKr8LLeeMLp+mZ6j0h0dKuX81MA0A1mySDdeKZy3uvuxUdzyaQqT
 Z7qU1pIJ/dVpRrmwaQwk/lhQ52ZiF5fe4bjX977/rKkSAHqYDqZuZeG9uXVoTrQyHuOqYUl/O
 uejqVRQpqOF8buU4d705HpBmZo8DKQ9fEkR6sH+syZB8UpdIGBJ/XhqyfyCDOh5DrZYrBwrYv
 aVMUpWJY54sr/WPCdZlaenN9zGxhO1Vd0BjrgmEZ9+EcGQJIfUqbiWqrXOacpL2Vdf7iYOie0
 LKv9nzliOBYn2K4mzDxxqOMHzBbwsgt8ATRi8qXbJRAPXDrJ4mx/RTrlY44ll2KY/YuBPF9vw
 BPTie0CQuBJqlmt2Uf2rtS1QpXy+mAjJKhysveKGInwKasZel8qJ2Y0MFv+PskTY4GspV9mD7
 YO6mLAg9D8MNxyzjCe7+T/X5dx+GPLX7lD7CNeSXQ7IwyNOjx4ukeZaJCcmrjgkL4joj3kMI1
 4+sa62hMEkSgZt3hEj3ANZGU/pU+tsCbp2NmcynDVQjqK+145KJjZprPKasIz409NBL4HPys2
 tIu7yw/PdDAePvCbGHLSQpZUYZ8LzECIqQhpd/wy6gTmNRDjdbIUkSkNzuurUiU0TK7PwDKfH
 5H2kzM8s9vHzRkl6uUYT/dYDev5XKvFbZ7Jq8f8tEEZDq5oKPzabnFAqoSXOj/iDZ1X4zN482
 dZC9/0Gl6yvF0aXbt4r1piUXC+simugUEDLqQe+jlTtjecApJ48nMjEeodbCDfTpXBSqpcKTX
 fB6q88k5EYygUFSzHRdrVps/l55neUGOvj6oLOn2qS+WeSkQl0Z/swp1YEysvPQWfxrou+ZB7
 MqAGnfe3FamTVXqA4v+fOREiW7ruMI74BDLfS7JDYuvp7b/rrtgWI8zo/yVx2T9TNzxBkGM5Y
 BUH8HZwq2hdex2CEDc1tMa48tDEA8wEJuYgY226Onyqx1LCVvAGp1EZ/B+ouo9IxKHV+eg0xq
 y/22Kzzl2I8NgNygGHVsf8yMEY6ED3OPVq3If8EFYOdiyg1PfqASZnX7wDfnydTdN6RQY03av
 qHPjz+fxvtUX3wVJV/TkdcBaxGuNco2EGOrvzxm+kV+F0IgXUUQXGNSKsPYu2DmpS1H3dKL3V
 UkLgpF47Jhtgqqq3CfNZX/dDlJbFp8lgDWb2qffOUWaCv8J0KiMd+XZD+GOsCvlVotQPYorAS
 U1ZgI7DCgQ5hj2H8gUeahSxv08xeFJqg3hlDWfL/JCRn3ZL1vRxBfH7rMuz13mWHzwFh5NqzV
 +uJGdcyZpMuAx1JfFB4rtDoLGZ0ZQGJAoEZaYzPVGq6j3eHseO5ckMlpNTEQQyEceB5gq/XAC
 rJ5YiJaR8EfVPHsnHVllydonGpPb/B3ACnvNmZgj93nJ2iGJXEa2+YJvnkwuHJ9qEdTpvHafG
 KxgUvcqnWsHfkj5BKCdwfBSL0Koqb1BAMBYva941R0EgRMRnvOgyWXD83SiqY/sJ74CnnW602
 xbxCBmQsL2biSCCXGQbSVp1qvVLWDUt2uE8By+RXmPqzHSe/E5PqglmnmtvlD7x+FZDNVCzmj
 aiUgXo6LLbGwtEpGZ4eL7zNP+5THQ8AfUAR8L11X88E88UjDJJC6gpxRa6nVRXVX6444vEs0K
 l/OCH2vvH5ljFMKBc7JmHWQ3iR0M8uQwwwUgpsDa2Z4YMpJ4Yw6FER0USzTyaqU+q1ZPlAo9q
 60HIJG8mbq0uXvi8FkTPKMLfOODjRcudCmnjA94CmjbS7Y9Bfv9Ij2sRPYAtNz5BEV4IaTWTb
 fr6iZz6gq6qadkuUF6oHfevjmiFjNluTg4kg3kg01av+0SBPMMaPOlYJSqwZEiX03oXiHpMpR
 Qu9ZNEpHx+30S2WrEgE0FmGFc5dDvGcZUJJV5h5UVULbQnXLuHFRRueAHhzE1HeYVyjGwSTVR
 PkvFQhimCJukbr0uLxz+J9S0dA8tM7hhEDBH1cK

=E2=80=A6
> Apply the same cleanup pattern to the remaining failure paths: remove th=
e
> async client, free the channel, and return early so no further messages =
are
> queued on a channel whose scl has been cleared.
=E2=80=A6
> ---
>  drivers/firmware/stratix10-rsu.c | 45 ++++++++++++++------------------=
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.1-rc5#n310

Regards,
Markus
