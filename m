From: Rob Herring <rob.herring@calxeda.com>
Date: Mon, 09 Jul 2012 02:44:24 +0000
Subject: Re: [clk:hb_3.5 11/12] drivers/ata/ahci_platform.c:129:2: warning: initialization discards 'const' q
Message-Id: <4FFA4588.5070006@calxeda.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120708171751.GA19344@localhost>
In-Reply-To: <20120708171751.GA19344@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/08/2012 09:08 PM, Fengguang Wu wrote:
> On Mon, Jul 09, 2012 at 01:17:51AM +0800, wfg@linux.intel.com wrote:
>> Hi Rob,
>>
>> There are new compile warnings show up in
>>
>> tree:   git://sources.calxeda.com/kernel/linux.git hb_3.5
>> head:   67e0749b2f1c5908346485f5cb54af9f3a01e047
>> commit: df55ea8b7785fb704475ad562d445ac402719dc0 [11/12] ahci_platform: add custom hard reset for Calxeda ahci ctrlr
>>
>> All warnings:
>>
>>         drivers/ata/ahci_platform.c:125:9: sparse: Initializer entry defined twice
>>         drivers/ata/ahci_platform.c:125:9:   also defined here
> 
> That warning is due to
> 
>         #define AHCI_SHT(drv_name)                                              \
>                 ATA_NCQ_SHT(drv_name),                                          \
> =>             .can_queue              = AHCI_MAX_CMDS - 1,                    \
>                 .sg_tablesize           = AHCI_MAX_SG,                          \
>                 .dma_boundary           = AHCI_DMA_BOUNDARY,                    \
>                 .shost_attrs            = ahci_shost_attrs,                     \
> =>             .sdev_attrs             = ahci_sdev_attrs
> 
> Re initilizes .can_queue and sdev_attrs to different values that was initially
> defined in 
> 
>         #define ATA_BASE_SHT(drv_name)                                  \
>                 .module                 = THIS_MODULE,                  \
>                 .name                   = drv_name,                     \
>                 .ioctl                  = ata_scsi_ioctl,               \
>                 .queuecommand           = ata_scsi_queuecmd,            \
> =>             .can_queue              = ATA_DEF_QUEUE,                \
>                 .this_id                = ATA_SHT_THIS_ID,              \
>                 .cmd_per_lun            = ATA_SHT_CMD_PER_LUN,          \
>                 .emulated               = ATA_SHT_EMULATED,             \
>                 .use_clustering         = ATA_SHT_USE_CLUSTERING,       \
>                 .proc_name              = drv_name,                     \
>                 .slave_configure        = ata_scsi_slave_config,        \
>                 .slave_destroy          = ata_scsi_slave_destroy,       \
>                 .bios_param             = ata_std_bios_param,           \
>                 .unlock_native_capacity = ata_scsi_unlock_native_capacity, \
> =>             .sdev_attrs             = ata_common_sdev_attrs
> 
>         #define ATA_NCQ_SHT(drv_name)                                   \
>                 ATA_BASE_SHT(drv_name),                                 \
>                 .change_queue_depth     = ata_scsi_change_queue_depth
> 
> Perhaps not easily fixable..
> 
>>         drivers/ata/ahci_platform.c:129:67: sparse: incorrect type in initializer (different modifiers)
>>         drivers/ata/ahci_platform.c:129:67:    expected void *data
>>         drivers/ata/ahci_platform.c:129:67:    got struct ata_port_info static const [toplevel] *
>>         drivers/ata/ahci_platform.c:129:2: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]
> 
> Rob,
> 
> Please consider folding this trivial fix for that warning.
> 
> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
> index 9a155ba..a7fcd0a 100644
> --- a/drivers/ata/ahci_platform.c
> +++ b/drivers/ata/ahci_platform.c
> @@ -126,7 +126,7 @@ static struct scsi_host_template ahci_platform_sht = {
>  };
>  
>  static const struct of_device_id ahci_of_match[] = {
> -	{ .compatible = "calxeda,hb-ahci", .data = &ahci_port_info[CALXEDA_AHCI], },
> +	{ .compatible = "calxeda,hb-ahci", .data = (void *)&ahci_port_info[CALXEDA_AHCI], },

I believe the warning is about const. Casting away the const is not the
right solution. There is a patch in flight to constify
of_device_id.data, but that has it's own challenges.

Rob

>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, ahci_of_match);
> 

