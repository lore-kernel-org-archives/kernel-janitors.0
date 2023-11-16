Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pCzA4aKV"
Received: from mout.web.de (mout.web.de [212.227.15.4])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372EC1AD
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Nov 2023 12:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700166621; x=1700771421; i=markus.elfring@web.de;
	bh=bMIHg3ng5KpBsFUPYXabL+iRStRao71P9CiqdQ1Rh04=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=pCzA4aKVeRcI+WTdroFUNT3qgmv2jWsC8Fx/nukm43dgIMgv6mPeASguCK882lQ7
	 Z1+tfebVWzBBKFHaERIJDBX74pK1PMHQYCmvtgnYpgPJhXWX9A/h1C7cblEK90tJF
	 4BSihGZnm7osVwdMYUHHQhMDOJ0TzxS05HPJJigM0WFG4DveeM9pBoJEvCwVoerlC
	 Ex8VsnwdtQQ96+ggB2vWwOH15Fe6dK4/dRehfHyuHtXAl+GMlWIUij7f4XoLpx4Av
	 cDvS0ssChvRDZVNuGlij0n2N7ptvTGPgsP8XJ1AMkyHcDywZu+vz1IzC6tociRCH2
	 cXgglhLqof5AavIESg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTvvy-1quGkf27cY-00R9fk; Thu, 16
 Nov 2023 21:24:47 +0100
Message-ID: <35a52379-5b97-46d4-be0f-1eca6d780a40@web.de>
Date: Thu, 16 Nov 2023 21:24:45 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: bcmasp: Use common error handling code in
 bcmasp_probe()
Content-Language: en-GB
To: Justin Chen <justin.chen@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>, Wojciech Drewek
 <wojciech.drewek@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 cocci@inria.fr, Simon Horman <horms@kernel.org>
References: <0b2972cb-03b2-40c7-a728-6ebe2512637f@web.de>
 <20231106145806.669875f4@kernel.org>
 <dce77105-47ab-4ec7-8d46-b983c630dad8@web.de>
 <CALSSxFYRgPwEq+QhCOYPqrtae8RvL=jTOcz4mk3vbe+Fc0QwbQ@mail.gmail.com>
 <4053e838-e5cf-4450-8067-21bdec989d1b@broadcom.com>
 <38279cb8-ff60-427e-ae9f-5f973955ffa6@web.de>
 <CALSSxFYBhv==pJTme0FThxP9JBJszsj1v4G2s-HGzkaevbyvBA@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CALSSxFYBhv==pJTme0FThxP9JBJszsj1v4G2s-HGzkaevbyvBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OIrOzr2zLfCRBOWIhQDkoUbk+8mTHFjp4JI5w2O+y8lMchJi4zR
 B87iRZrxV12DjNwGuQclyM0vTDc3Zru04L/rLTyiXZbYfVdaHUydVKTqvT5BFtO3DJn+tkU
 nskTWsmgVIbdmu3BSqPbKLWRdklp5cg03fmcQcJ/0YursqXGt3+Xx9ASV0eppbCRIhMGhqQ
 0S+rgQwV75GIT7OBWmTUA==
UI-OutboundReport: notjunk:1;M01:P0:TiUzUvYKq3o=;/Tokf5qKwaDUta0ONHunkeclBAF
 o5HA5sbyNFJcle7M7OuJNTYy7F0+kyYv7OHka09YxwO4RsaR9e15QhcL41tmYYHqWbFvDBOsk
 4O43nEOl5fKrgc8M/8G0ws/tDPlz+g04qqz/i7cBSMEGb7vXPobbIp6B3ZbYrtuajRoajEoSn
 6mccfcNPnoKV7/M0H/oeAEn0/4O7T6ks8fnwwqi9HVxnvdCi7Db9N+yAIZ1wfmhgMC48/mQ24
 vIu0kV2auBexoJ/CBIyBMIbCR9cSoE1U6+x+XqIdg+0esZSMQwrtjurSOkzGIYZwgujQCe8eF
 bNWLE4WQhTbITxb5qnKlK/ecfiWHw8BixwKd8nreAXKYfrS1Dlz6GgwgyK+mbxlbFx18/WG42
 EQHMmKmndBQvEDYGwNTPxCESCFH8TGUdHlaDUQj72LN4FgkoZyHA+Kf3lnZp+9L8Pkl7GeSoN
 KClDa3iNMPP4nCrUxW9hb5c1DiK+IFv3RNNyLqqxlQk81PizvyDbygZkvoqowU4Q4tO9tnKYe
 Q4uW3CMmO5zCH4pyHBlFe2o3jcs5oqxv5VYTzadeSc4YyivyFRutET/4VyBmHE3/zkfSjoeHB
 vBi93Z1sGytjExEc65wQ1lUnCIxWnqgcrB4sbb/IRkn9tUFkiDQXV4H43H86LsGoUMY/Cv1go
 iDP+1i6vwtUKUhPvrV/phwry9CZ320iDo1xp3kE3LPoegSq6ER2hvRF8EBQkrXlnn5h3uYoOi
 fYElavVKAJedOvJOMCURh0nar09e6iSxudoC2vojFLGcE18y/j5JQ1vNq3saXoU9Sb23Ai1rx
 VsEa/xuiQ83nCfshvGd1aVZyKFFgBqXBjnB3jSNlj7nHkqWDqHFZAdz0sS3vSa8p3F9b3C6hq
 nRtVSx88zDz+yZYAEvvbsYP0/A0sXT0Ply4NlLPtuEXZ8nTm8d/fbzbOjAGP936I1uzEvNq5v
 MUwast75MNeyeIH5lWofvDO1lyI=

>> Add a jump target so that a bit of exception handling can be better reu=
sed
>> in this function implementation.
=E2=80=A6
>> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> @@ -1304,9 +1304,8 @@ static int bcmasp_probe(struct platform_device *p=
dev)
>>                 intf =3D bcmasp_interface_create(priv, intf_node, i);
>>                 if (!intf) {
>>                         dev_err(dev, "Cannot create eth interface %d\n"=
, i);
>> -                       bcmasp_remove_intfs(priv);
>>                         of_node_put(intf_node);
>> -                       goto of_put_exit;
>> +                       goto remove_intfs;
>>                 }
>>                 list_add_tail(&intf->list, &priv->intfs);
>>                 i++;
>> @@ -1331,6 +1330,7 @@ static int bcmasp_probe(struct platform_device *p=
dev)
>>                         netdev_err(intf->ndev,
>>                                    "failed to register net_device: %d\n=
", ret);
>>                         priv->destroy_wol(priv);
>> +remove_intfs:
>>                         bcmasp_remove_intfs(priv);
>>                         goto of_put_exit;
>>                 }
>> --
>> 2.42.1
>>
> nak. Doesn't save any lines of code.

Would you get into the mood to take also another look at consequences for =
executable code?


> Doesn't make things clearer or easier to follow.

Maybe.


> This doesn't seem like an improvement to me.

Can this software implementation benefit from one function call less?

Regards,
Markus
