From: Jeremy Fitzhardinge <jeremy@goop.org>
Date: Wed, 29 Oct 2008 12:52:43 +0000
Subject: Re: [PATCH 03/12] x86: Cleanup usage of struct desc_struct
Message-Id: <49085C9B.6000905@goop.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <> <1224904532-9586-1-git-send-email-ice799@gmail.com> <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com> <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com> <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
In-Reply-To: <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Damato <ice799@gmail.com>
Cc: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Damato wrote:
> Use gate_desc typedef for IDT entries instead of struct desc_struct.
>   

Why's that?  In general we try to avoid typedefs unless they're really 
necessary.  If it is necessary, it should be named gate_desc_t.

    J
