Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bB9GTIJn"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D508DBD;
	Wed, 22 Nov 2023 12:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PQI5ftJTGKiUGLporU6xLWoqm+T6ThDbFdStpj7smvI=; b=bB9GTIJnwrGs4GYiuojruLSxdl
	bpTRML45JKO7EHm7gU5dkRoVIHSoANj7jjTkLrcrhr1rVWwF6XJpiawYEb0odX7r9tUDtuUFpfoPm
	xUm8kp6D0IkXwDpPL9wTLGjlhX4+8Df9sc5Ej8QU2oCreGZUUhiV8WbvGPvEfyAjTsyWyipV4YkMd
	j4tCFKlM5SAN5mErBvWKZC/r3+CWUGjoW5cGz+pTVBi5lryG1tKIv0FfajxHexhH05DMa48sPGmh9
	OYyIo9KxnwGDLDl0ltaFyYBppIe2dxmE0eUBzAruBdqmAkwsn2jHv/J2dxZHLlb3GrDx7nLy/avpj
	syWM/mrw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r5tYl-002zae-1J;
	Wed, 22 Nov 2023 20:10:55 +0000
Message-ID: <7daeaa9e-39b7-4205-8769-ecd1817b9c3b@infradead.org>
Date: Wed, 22 Nov 2023 12:10:54 -0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] scripts/spelling.txt: add more spellings to
 spelling.txt
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231122104037.1770749-1-colin.i.king@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231122104037.1770749-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/23 02:40, Colin Ian King wrote:
> Some of the more common spelling mistakes and typos that I've found while
> fixing up spelling mistakes in the kernel over the past couple of
> releases.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  scripts/spelling.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
