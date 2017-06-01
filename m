From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Thu, 01 Jun 2017 13:05:16 +0000
Subject: Re: [PATCH] Remove an extra out label in _fcoe_create function
Message-Id: <ce2dc5ed-cf90-274f-3f6c-1b22018978bb@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d0539e8-ec2e-eac3-a91b-bfda55e83eca@redhat.com>
In-Reply-To: <0d0539e8-ec2e-eac3-a91b-bfda55e83eca@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mgandhi@redhat.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Laurence Oberman <loberman@redhat.com>, Johannes Thumshirn <jth@kernel.org>

On 06/01/2017 02:08 PM, Milan P. Gandhi wrote:
> This patch removes an extra out label in _fcoe_create function
> where we return if creation of FCOE interface is failed.
> 
> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
> ---

Thanks,
Acked-by: Johannes Thumshirn <jth@kernel.org>

-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
