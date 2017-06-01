From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Thu, 01 Jun 2017 13:07:20 +0000
Subject: Re: [PATCH] Eliminate extra 'out_free' label from fcoe_init function
Message-Id: <2b91bd28-61f9-9db0-68d4-7fd25ed6eaa1@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a1ea0104-83ed-2249-3450-dc5c31517558@redhat.com>
In-Reply-To: <a1ea0104-83ed-2249-3450-dc5c31517558@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mgandhi@redhat.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>, Laurence Oberman <loberman@redhat.com>

On 06/01/2017 02:11 PM, Milan P. Gandhi wrote:
> Simplify the check for return code of fcoe_if_init routine
> in fcoe_init function such that we could eliminate need for
> extra 'out_free' label.
> 
> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
> ---

Ahm and what happens to the fcoe_wq then?


-- 
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
