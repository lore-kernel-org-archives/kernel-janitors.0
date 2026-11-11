Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405704;
	b=mWxsdE/ZSe6R7k5AUsGvyrwjUZZGI9BUTiyqVHuAWoJ4JfmXnCwUfzE8TCjYlFsqZxUv
	 PimvStJkNF14+fr7QQyJf+qU1CYB1hGxDkzrWtMLGecJxG9IaTKIsI85oqezdHSO8TwRb
	 kMS7JhAl5vqgRrY65k48W5XCPx9cS0xmRKegbD/UvOtSGH4JseI379REudLpd8n3NgpkV
	 vLiz3qCRquq2BSMx7JX24CX/nLYCow3cPjhgSaZZi09j6HmzT6OHOPniMaPOvQWU8tj3C
	 allxbm+40N8fAMt+WfL5m9wO0eU7csSLalJ0nqwGJP/GTYCXLz/jiOZ6LZ/T1yxZWPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405704;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UMq53urTChEqakbyKN3u3QbkjFvSjvgE2saHaYUmqek=;
	b=MD32zUSHhYWtZMO8eWcKNLYuePN2ck9VQAjhQqoOjSngdxq7Bir//omQs9E9cfGuj3Z6
	 6+BWN1pv8EJQtfDlSOlA2ukzzCNy+mDcQ9ksuFam/m4jOB9NPWf7Kq2okHC5hl68o3z3D
	 sJ83pcpKlWtJFDc7aJzh6DBwcqOKUvYRJjQePw6Vq9B1WlDYUBR3JKvZLyjOi34IV8y7U
	 CE5nXL8sKAq9lx1Jdx+HOdHkxK/sfCqQfxrClgGdJrN2fgpO+9sA1I/5nfFsnmJ/bAqSU
	 RHEFfkvpmOB8WslqwDZr4OhAu8q65sCC6NjNfnHbBE5RFnMx+Q/U037pNxuULaAz6sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KKBmtlZX;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F906606A326;
	Wed, 11 Nov 2026 14:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F906606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KKBmtlZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=UMq53urTChEqakbyKN3u3QbkjFvSjvgE2saHaYUmqek=; t=1794405703; x=2109765703; 
	b=KKBmtlZXe0JkeT1mc27G3Mh0TXwtZp4kif/noj3Lx70uWn6/1o2M2UcV1D3banazW72BOtCp6VZ
	k8p7b8h5fy5ITrmc3K0lkFoA96L1xC15IDHaLhmqaGYCjXqBAAd4rEWwcrXekKbUCsIeCqsxB8mI8
	iclx7HG9qeL+wAsgFVocoSw3wEpUartHSOX0Q7KYJmiLkTFUKk/uSduwCm/Kv+zwpI8PtmlUL0RbK
	/LMMIemQ28EK6H4MDBUHs+p3d1HnZr3FLTP+tPfVXw5nkivYNk8z8OOVSAkJx9vGZ9VnsFz0bGWCL
	WcvxV7/Hr8vb2krHtEWHtRLrtOE897+K4SOw==;
Received: from [179.105.94.163] (helo=[192.168.0.4])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xR8tD-008qp2-Bg; Wed, 11 Nov 2026 15:01:27 +0100
Message-ID: <6028f8d4-5e57-4d83-81ae-2a679361a432@igalia.com>
Date: Wed, 11 Nov 2026 11:01:20 -0300
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vc4: release firmware on error paths in
 vc4_hvs_bind()
To: Dan Carpenter <dan@pereq.eu>, Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
 <20261111131528.316472-1-tomasz.unger@yahoo.pl>
 <avRxlbgy9mtT1rR6@stanley.mountain>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <avRxlbgy9mtT1rR6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dan,

On 11/11/26 10:45, Dan Carpenter wrote:
> On Wed, Nov 11, 2026 at 02:15:28PM +0100, Tomasz Unger wrote:
>> So without the patch every failed bind leaks one reference, and with the
>> patch the reference is dropped.
>>
>> Tested-by: Tomasz Unger <tomasz.unger@yahoo.pl>
>>
>> One note about the Fixes tag: 2fa4ef5fb943 only moved this code around.
>> As far as I can tell, the rpi_firmware_get() before devm_clk_get()
>> without a put on the error path was introduced by commit 2a001ca00ad5
>> ("drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection code"), which went
>> into v6.2.
> 
> Huh.  Wow.  Thanks.  I'll resend the patch with the correct Fixes tag.

A patch addressing this issue is already queued for this week's drm PR
[1]. Sorry for letting your patch slip through the cracks.

[1] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/af200e91c7b996177aa90981b2f0e794b085d43a

Best regards,
- Maíra

> 
> regards,
> dan carpenter
> 

