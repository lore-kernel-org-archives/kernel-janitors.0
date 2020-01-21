From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2020 11:48:35 +0000
Subject: Re: Re: [PATCH 1/2] cmd64x: potential buffer overflow in cmd64x_program_timings()
Message-Id: <20200121114835.GB1847@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
 <20200120.144042.1810086369376110530.davem@davemloft.net>
 <CGME20200121111555eucas1p2d26b5230ab428f40ee3fc76d687e601f@eucas1p2.samsung.com>
 <faf4b367-29b3-474c-73bc-400f6ab36758@samsung.com>
In-Reply-To: <faf4b367-29b3-474c-73bc-400f6ab36758@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: David Miller <davem@davemloft.net>, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jan 21, 2020 at 12:15:54PM +0100, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On 1/20/20 2:40 PM, David Miller wrote:
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > Date: Tue, 7 Jan 2020 16:04:41 +0300
> > 
> >> The "drive->dn" value is a u8 and it is controlled by root only, but
> >> it could be out of bounds here so let's check.
> 
> drive->dn should not be root controllable, please point me where it
> happens as this may need fixing instead of cmd64x driver.
> 
> [ IDE core makes sure that drive->dn is never > 3 and a lot of code
>   assumes it. ]
> 

It's a marked as a setable field in ide-proc.c

drivers/ide/ide-proc.c
   206  ide_devset_rw(current_speed, xfer_rate);
   207  ide_devset_rw_field(init_speed, init_speed);
   208  ide_devset_rw_flag(nice1, IDE_DFLAG_NICE1);
   209  ide_devset_rw_field(number, dn);
                            ^^^^^^^^^^
Sets ->dn

   210  
   211  static const struct ide_proc_devset ide_generic_settings[] = {
   212          IDE_PROC_DEVSET(current_speed, 0, 70),
   213          IDE_PROC_DEVSET(init_speed, 0, 70),
   214          IDE_PROC_DEVSET(io_32bit,  0, 1 + (SUPPORT_VLB_SYNC << 1)),
   215          IDE_PROC_DEVSET(keepsettings, 0, 1),
   216          IDE_PROC_DEVSET(nice1, 0, 1),
   217          IDE_PROC_DEVSET(number, 0, 3),
   218          IDE_PROC_DEVSET(pio_mode, 0, 255),
   219          IDE_PROC_DEVSET(unmaskirq, 0, 1),
   220          IDE_PROC_DEVSET(using_dma, 0, 1),
   221          { NULL },
   222  };

drivers/ide/ide-devsets.c
   159  int ide_devset_execute(ide_drive_t *drive, const struct ide_devset *setting,
   160                         int arg)
   161  {
   162          struct request_queue *q = drive->queue;
   163          struct request *rq;
   164          int ret = 0;
   165  
   166          if (!(setting->flags & DS_SYNC))
   167                  return setting->set(drive, arg);
                               ^^^^^^^^^^^^^^^^^^^^^^^^
Called from here according to Smatch.

   168  
   169          rq = blk_get_request(q, REQ_OP_DRV_IN, 0);

regards,
dan carpenter
