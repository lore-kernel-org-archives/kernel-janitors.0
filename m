Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35B230CDB5;
	Mon,  1 Dec 2025 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593347; cv=none; b=C9zRSHqF0a33FxHgvzUTW6fWQ3V3ERcpTKt3JA+Kh0UhSpn248mOw25IPvPN1B6ksy8749x77Xnign+XxHlnf8Q05CI7cmZPcCGmARUAKcNITDGxBav6mDmEWgJZb7guX1Wafar+MQU1MiprXV6c7tVGE4x1B9xFezDAzJgHvpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593347; c=relaxed/simple;
	bh=+7oXb1SclDWbxrHa6PG9V563IhGawyj/xgpPtohGwRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+xFk59XwikxTEYxhwAQI2hIkCMShbGCKURHpL2YukYzKxV4jDP4qFSvepuJvytZBawnV0VDQjjuEAwltlL6GrtqybPFi3gT/GjXdHuOn3Lptb0RY8Zl1XzFX9PV+V7a/xwKAgeTf7InscvqPmVzJU536AYoSmavy3iqVE3L5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/Isj3Cx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/Isj3Cx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF1DC4CEF1;
	Mon,  1 Dec 2025 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764593346;
	bh=+7oXb1SclDWbxrHa6PG9V563IhGawyj/xgpPtohGwRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W/Isj3Cxrf0BraGdfDYg9HE9ZDnuflCOm8jrRUPmJhY01CfYqLBFAod9ZHdm5Lse5
	 u49yx2LgBItxuZMtwIKIsf+WHW5D5XuqiC2n5jaJOlziJmhOr3OaFR3by7MHblnFp+
	 LOunRYZC8KJfIUct29XhRZYGh1NsP6uckQ8EQQxG4bjxP/iIlKW3HbgmA7E9A63R7g
	 5FN9Gjkn9wkdZLHpro27bJbXVryq6ECxqt7DtVLOWjnuu2UwbhovgN7YlhXhvM7EsW
	 n480PyZ992/7doXkwQTOF3bNXvE71jTlikee2lnQB4YWyNwOwjf2Mb7MKtPUZaBvTB
	 gn8TistKDv4Tw==
Message-ID: <26a66461-c06a-4c86-b597-52cdfb05dc84@kernel.org>
Date: Mon, 1 Dec 2025 13:48:59 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: fix config option typo in header file
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alice Ryhl <aliceryhl@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20251201122922.352480-1-lukas.bulwahn@redhat.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251201122922.352480-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/25 13:29, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 

Subject: "mm: fix CONFIG_STACK_GROWSUP typo in mm.h"

> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") significantly
> refactors the header file include/linux/mm.h. In that step, it introduces
> a typo in an ifdef, referring to a non-existing config option
> STACK_GROWS_UP, whereas the actual config option is called STACK_GROWSUP.
> 
> Fix this typo in the mm header file.
> 
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Right, the commit is already in mm-stable

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

> ---
>   include/linux/mm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 96acf31268ac..394126bf637a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -443,7 +443,7 @@ enum {
>   #define VM_NOHUGEPAGE	INIT_VM_FLAG(NOHUGEPAGE)
>   #define VM_MERGEABLE	INIT_VM_FLAG(MERGEABLE)
>   #define VM_STACK	INIT_VM_FLAG(STACK)
> -#ifdef CONFIG_STACK_GROWS_UP
> +#ifdef CONFIG_STACK_GROWSUP
>   #define VM_STACK_EARLY	INIT_VM_FLAG(STACK_EARLY)
>   #else
>   #define VM_STACK_EARLY	VM_NONE


-- 
Cheers

David
