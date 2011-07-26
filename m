From: Avi Kivity <avi@redhat.com>
Date: Tue, 26 Jul 2011 17:24:33 +0000
Subject: Re: [patch v2] x86: kvm: x86: fix information leak to userland
Message-Id: <4E2EF851.8060202@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288447871-7715-1-git-send-email-segooon@gmail.com> <4CCC2D11.7090109@web.de> <20101030153147.GA14169@albatros> <4CCC3DC2.6090505@web.de> <20101030185447.GA7629@albatros> <ABD7343A-6440-4CC0-B8B0-9D27EF0291B0@suse.de>
In-Reply-To: <ABD7343A-6440-4CC0-B8B0-9D27EF0291B0@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Graf <agraf@suse.de>
Cc: Vasiliy Kulikov <segooon@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, kernel-janitors@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/26/2011 08:05 PM, Alexander Graf wrote:
> struct kvm_pit_state2 {
>          struct kvm_pit_channel_state channels[3];
>          __u32 flags;
>          __u32 reserved[9];
> };
>
> So memset(&ps->reserved) would give you the a __u32 **, no? Same goes for all the other array sets in here. Or am I understanding some C logic wrong? :)
>

An address of an array is the array itself.

-- 
error compiling committee.c: too many arguments to function

