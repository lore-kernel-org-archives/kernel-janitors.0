From: "H. Peter Anvin" <hpa@zytor.com>
Date: Tue, 12 Jun 2007 16:52:07 +0000
Subject: [KJ] Re: [KJ PATCH] Replacing memcpy(dest, src,
Message-Id: <466ECF37.6040303@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181616342.2282.8.camel@shani-win> <m1vedtpwks.fsf@ebiederm.dsl.xmission.com>
In-Reply-To: <m1vedtpwks.fsf@ebiederm.dsl.xmission.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Shani Moideen <shani.moideen@wipro.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Eric W. Biederman wrote:
> Shani Moideen <shani.moideen@wipro.com> writes:
> 
>> Hi,
>> Replacing memcpy(dest,src,PAGE_SIZE) with copy_page(dest,src) in
>> arch/i386/kernel/machine_kexec.c.
> 
> Please no.
> 
> People get creative in copy_page (especially mmx_copy_page),
> and this code path need something simple and stupid, that
> will work every time, especially when things are messed up
> elsewhere.
> 

memcpy() is pretty creative, too.  If you want something really dumb and
robust, you should probably create an inline:

/*
 * Eric sez: his code path need something simple and stupid, that
 * will work every time, especially when things are messed up
 * elsewhere.
 */
static inline void braindead_copy_page(void *dst, void *src)
{
	unsigned long ctr = PAGE_SIZE >> 2;

	asm volatile("cld; rep; movsl"
			: "+D" (dst), "+S" (src), "+c" (ctr)
			: : "memory");
}

(FWIW, the "cld" is supposed to be redundant, as DF=0 is supposed to be
guaranteed by the ABI.)

	-hpa
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
