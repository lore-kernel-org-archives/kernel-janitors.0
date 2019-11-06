From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 06 Nov 2019 09:44:57 +0000
Subject: Re: [PATCH] kvm: Fix NULL dereference doing kvm_create_vm()
Message-Id: <7eddf725-e034-d65d-3fb1-2babcfaa812d@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106082636.GB31923@mwanda>
 <8f7e33e9-9ae0-4f56-3bb6-b9f3db807d38@de.ibm.com>
In-Reply-To: <8f7e33e9-9ae0-4f56-3bb6-b9f3db807d38@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Borntraeger <borntraeger@de.ibm.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jim Mattson <jmattson@google.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Junaid Shahid <junaids@google.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, Wanpeng Li <wanpengli@tencent.com>

On 06/11/19 09:30, Christian Borntraeger wrote:
> The same patch was already sent by Wanpeng Li.
> 
> See 
> https://lore.kernel.org/lkml/1572848879-21011-1-git-send-email-wanpengli@tencent.com/

I'm also going to send a somewhat different version today (hopefully).
Stay tuned...

Paolo
