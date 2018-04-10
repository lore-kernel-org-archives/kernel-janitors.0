From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 10 Apr 2018 15:35:43 +0000
Subject: Re: [PATCH] x86/microcode/AMD: fix read of uninitialized data
Message-Id: <db1f2e8f-089d-5f42-3641-8963b19ed834@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180410134123.13832-1-colin.king@canonical.com>
 <20180410142252.crnlqkia2pmucbum@mwanda>
In-Reply-To: <20180410142252.crnlqkia2pmucbum@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/04/18 15:22, Dan Carpenter wrote:
> On Tue, Apr 10, 2018 at 02:41:23PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently function __load_ucode_amd can assign an uninitialized cp to *ret
>> if get_builtin_microcode returns false.
> 
> What are you looking at?  Here is how it looks in linux-next:
> 
>    270  
>    271          if (!get_builtin_microcode(&cp, x86_family(cpuid_1_eax)))
>    272                  cp = find_microcode_in_initrd(path, use_pa);
>    273  
> 
> 
> If get_builtin_microcode() returns false, then cp is initialized on the
> next line.
> 
> Maybe the issue is that cp.name is uninitialized.  It doesn't cause an
> issue but it would be understandable for a static checker to warn about
> it when we do "*ret = cp;".

Oh, oops, you are totally correct on that. My bad.


> 
> regards,
> dan carpenter
> 

