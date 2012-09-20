From: Saurav Kashyap <saurav.kashyap@qlogic.com>
Date: Thu, 20 Sep 2012 05:40:04 +0000
Subject: Re: drivers/scsi/qla2xxx/qla_os.c:3722 code aligned with following code on line 3723
Message-Id: <CC80A982.E265%saurav.kashyap@qlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919031034.GA22081@localhost>
In-Reply-To: <20120919031034.GA22081@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks Fengguang for clarification. The following patch should fix this
warning

diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index c7dd298..de9dfcf 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -3721,8 +3721,8 @@ void qla2x00_relogin(struct scsi_qla_host *vha)
                                                if (fcport->flags &
                                                    FCF_FCP2_DEVICE)
                                                        opts |= BIT_1;
-                                                       status2 -
qla2x00_get_port_database(
+                                               status2 +
qla2x00_get_port_database(
                                                                vha,
fcport,
                                                                opts);
                                                if (status2 != QLA_SUCCESS)
lines 1-15/15 (END)

It passed the checkpatch.pl.

Thanks,
~Saurav



>On Thu, Sep 20, 2012 at 12:24:55AM -0500, Saurav Kashyap wrote:
>> +Chad, Giri
>>
>> Hi Fengguang,
>>
>> It not very clear on what the warning is reported for, can you provide
>> more information regarding this?
>
>This warning will be triggered for such code:
>
>        if (xxx)
>                yyy;
>                zzz;
>
>Where one would expect the reasonable format to be either
>
>        if (xxx) {
>                yyy;
>                zzz;
>        }
>
>or
>
>        if (xxx)
>                yyy;
>        zzz;
>
>Thanks,
>Fengguang
>
>> >Hi Saurav,
>> >
>> >FYI, there are new coccinelle warnings show up in
>> >
>> >commit aaf4d3e2c647b5d1b24082b766c173e6c7edf79b
>> >Author:     Saurav Kashyap <saurav.kashyap@qlogic.com>
>> >Commit:     James Bottomley <JBottomley@Parallels.com>
>> >CommitDate: Thu May 10 08:18:04 2012 +0100
>> >
>> >    [SCSI] qla2xxx: Properly check for current state after the
>> >fabric-login request.
>> >
>> >
>> >+ drivers/scsi/qla2xxx/qla_os.c:3722:7-21: code aligned with following
>> >code on line 3723
>> >
>> >vim +3722 drivers/scsi/qla2xxx/qla_os.c
>> >  3712                                 } else {
>> >  3713                                         status >>qla2x00_fabric_login(vha,
>> >  3714                                             fcport,
>>&next_loopid);
>> >  3715                                         if (status =
>>QLA_SUCCESS) {
>> >  3716                                                 int status2;
>> >  3717                                                 uint8_t opts;
>> >  3718
>> >  3719                                                 opts = 0;
>> >  3720                                                 if
>>(fcport->flags &
>> >  3721
>>FCF_FCP2_DEVICE)
>> >> 3722                                                         opts |>>BIT_1;
>> >  3723                                                         status2
>>>> >  3724
>>qla2x00_get_port_database(
>> >  3725
>>vha, fcport,
>> >  3726
>>opts);
>> >  3727                                                 if (status2 !>>QLA_SUCCESS)
>> >  3728                                                         status
>>= 1;
>> >  3729                                         }
>> >  3730                                 }
>> >  3731                         } else
>> >  3732                                 status >>qla2x00_local_device_login(vha,
>> >
>> >---
>> >0-DAY kernel build testing backend         Open Source Technology
>>Centre
>> >Fengguang Wu, Yuanhan Liu                              Intel
>>Corporation
>> >
>>
>>
>> This message and any attached documents contain information from QLogic
>>Corporation or its wholly-owned subsidiaries that may be confidential.
>>If you are not the intended recipient, you may not read, copy,
>>distribute, or use this information. If you have received this
>>transmission in error, please notify the sender immediately by reply
>>e-mail and then delete this message.


This message and any attached documents contain information from QLogic Corporation or its wholly-owned subsidiaries that may be confidential. If you are not the intended recipient, you may not read, copy, distribute, or use this information. If you have received this transmission in error, please notify the sender immediately by reply e-mail and then delete this message.

