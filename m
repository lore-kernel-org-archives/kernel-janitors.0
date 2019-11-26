From: Markus Theil <markus.theil@tu-ilmenau.de>
Date: Tue, 26 Nov 2019 05:25:02 +0000
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
Message-Id: <6872919d-3ca8-6fa5-ac9b-1b0f016e709b@tu-ilmenau.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
In-Reply-To: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Felix Fietkau <nbd@nbd.name>
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

On 11/26/19 5:49 AM, Dan Carpenter wrote:
> The sband->bitrates[] array has "sband->n_bitrates" elements so this
> check needs to be >= instead of > or we could read beyond the end of the
> array.
>
> These values come from when we call mt76_register_device():
>
> 	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
> 				   ARRAY_SIZE(mt7603_rates));
>
> Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
> ARRAY_SIZE()
>
> Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and survey")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/mediatek/mt76/airtime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/airtime.c b/drivers/net/wireless/mediatek/mt76/airtime.c
> index 55116f395f9a..a4a785467748 100644
> --- a/drivers/net/wireless/mediatek/mt76/airtime.c
> +++ b/drivers/net/wireless/mediatek/mt76/airtime.c
> @@ -242,7 +242,7 @@ u32 mt76_calc_rx_airtime(struct mt76_dev *dev, struct mt76_rx_status *status,
>  			return 0;
>  
>  		sband = dev->hw->wiphy->bands[status->band];
> -		if (!sband || status->rate_idx > sband->n_bitrates)
> +		if (!sband || status->rate_idx >= sband->n_bitrates)
>  			return 0;
>  
>  		rate = &sband->bitrates[status->rate_idx];

This should fix the division by zero error I sometimes got yesterday.

[   63.115806] divide error: 0000 [#1] PREEMPT SMP NOPTI
[   63.121054] CPU: 0 PID: 225 Comm: kworker/u8:2 Tainted: G        W         5.4.0-rc7-1-01110-g19b7e21c55c8 #39
[   63.131331] Hardware name: PC Engines apu2/apu2, BIOS v4.10.0.3 11/07/2019
[   63.138399] Workqueue: mt76u mt76u_tx_status_data [mt76_usb]
[   63.144258] RIP: 0010:mt76_calc_rx_airtime+0x12b/0x150 [mt76]
[   63.150281] Code: 8d 34 76 48 8d 34 b1 0f b6 4e 07 66 85 c9 74 25 66 83 f9 01 75 1c b9 24 00 00 00 89 d0 0f b7 76 04 c1 e0 05 8d 04 d0 01 c0 99 <f7> fe 01 c8 c3 31 c0 c3 0f 0b c3 44 89 c8 83 e0 01 3c 01 19 c9 83
[   63.169699] RSP: 0018:ffffbd694032fcf0 EFLAGS: 00010216
[   63.175176] RAX: 0000000000002850 RBX: 0000000000000001 RCX: 00000000000000ca
[   63.182535] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa20068253538
[   63.189983] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   63.197381] R10: 0000000000000000 R11: ffffbd694032fcb0 R12: ffffbd694032fdb0
[   63.204782] R13: 0000000000000000 R14: ffffbd694032fd00 R15: ffffa20068251e40
[   63.212228] FS:  0000000000000000(0000) GS:ffffa2006aa00000(0000) knlGS:0000000000000000
[   63.220614] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   63.226500] CR2: 00007fe65ba85cb0 CR3: 00000001293b6000 CR4: 00000000000406f0
[   63.233841] Call Trace:
[   63.236410]  mt76_calc_tx_airtime+0xf4/0x190 [mt76]
[   63.241464]  mt76x02_send_tx_status+0x1cd/0x3f0 [mt76x02_lib]
[   63.247430]  mt76x02_tx_status_data+0x54/0x80 [mt76x02_lib]
[   63.253186]  mt76u_tx_status_data+0x63/0xc0 [mt76_usb]
[   63.258451]  process_one_work+0x1e2/0x3b0
[   63.262533]  worker_thread+0x4a/0x3d0
[   63.266306]  kthread+0xfb/0x130
[   63.269550]  ? process_one_work+0x3b0/0x3b0
[   63.273893]  ? kthread_park+0x90/0x90
[   63.277677]  ret_from_fork+0x22/0x40
[   63.281411] Modules linked in: ccm bridge stp llc mt76x2u mt76x2_common mt76x02_usb mt76_usb mt76x02_lib mt76 nft_masq nft_chain_nat nf_nat nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c nf_tables_set nf_tables nfnetlink ath10k_pci ath10k_core amd64_edac_mod edac_mce_amd ath kvm_amd mac80211 kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel pcengines_apuv2 cfg80211 gpio_keys_polled crypto_simd input_polldev gpio_amd_fch cryptd igb glue_helper pcspkr fam15h_power sp5100_tco k10temp i2c_piix4 rfkill i2c_algo_bit ccp libarc4 dca rng_core uio_pdrv_genirq evdev leds_gpio uio mac_hid coreboot_table acpi_cpufreq pinctrl_amd sr_mod cdrom ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2 sd_mod usb_storage ahci libahci libata xhci_pci sdhci_pci xhci_hcd scsi_mod cqhci sdhci ehci_pci crc32c_intel ehci_hcd mmc_core gpio_keys
[   63.365937] ---[ end trace f13e9cdc5f55db9e ]---
[   63.370802] RIP: 0010:mt76_calc_rx_airtime+0x12b/0x150 [mt76]
[   63.376807] Code: 8d 34 76 48 8d 34 b1 0f b6 4e 07 66 85 c9 74 25 66 83 f9 01 75 1c b9 24 00 00 00 89 d0 0f b7 76 04 c1 e0 05 8d 04 d0 01 c0 99 <f7> fe 01 c8 c3 31 c0 c3 0f 0b c3 44 89 c8 83 e0 01 3c 01 19 c9 83
[   63.396220] RSP: 0018:ffffbd694032fcf0 EFLAGS: 00010216
[   63.401660] RAX: 0000000000002850 RBX: 0000000000000001 RCX: 00000000000000ca
[   63.409145] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa20068253538
[   63.416505] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   63.423988] R10: 0000000000000000 R11: ffffbd694032fcb0 R12: ffffbd694032fdb0
[   63.431425] R13: 0000000000000000 R14: ffffbd694032fd00 R15: ffffa20068251e40
[   63.438793] FS:  0000000000000000(0000) GS:ffffa2006aa00000(0000) knlGS:0000000000000000
[   63.447141] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   63.453216] CR2: 00007fe65ba85cb0 CR3: 00000001293b6000 CR4: 00000000000406f0
