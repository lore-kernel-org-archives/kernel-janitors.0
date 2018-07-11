From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Date: Wed, 11 Jul 2018 08:07:05 +0000
Subject: RE: [bug report] mei: expose fw version to sysfs
Message-Id: <C980C034A53E0646B96866D6CE3D187AD0F854AD@HASMSX110.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180711074254.oa7m6m23d2ldp6wr@kili.mountain>
In-Reply-To: <20180711074254.oa7m6m23d2ldp6wr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi

Tomas have patch for this, it will be pushed soon.

--
Alexander (Sasha) Usyskin

CSE FW Dev - Host SW
Intel Israel (74) Limited



> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, July 11, 2018 10:43
> To: Usyskin, Alexander <alexander.usyskin@intel.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] mei: expose fw version to sysfs
> 
> Hello Alexander Usyskin,
> 
> The patch 3cfaeb335305: "mei: expose fw version to sysfs" from Jun 25, 2018,
> leads to the following static checker warning:
> 
> 	drivers/misc/mei/bus-fixup.c:184 mei_fwver()
> 	warn: 'bytes_recv' possible negative type promoted to high
> 
> drivers/misc/mei/bus-fixup.c
>    160  #define MKHI_RCV_TIMEOUT 500 /* receive timeout in msec */
>    161  static int mei_fwver(struct mei_cl_device *cldev)
>    162  {
>    163          char buf[MKHI_FWVER_BUF_LEN];
>    164          struct mkhi_msg *req;
>    165          struct mkhi_fw_ver *fwver;
>    166          int bytes_recv, ret, i;
>    167
>    168          memset(buf, 0, sizeof(buf));
>    169
>    170          req = (struct mkhi_msg *)buf;
>    171          req->hdr.group_id = MKHI_GEN_GROUP_ID;
>    172          req->hdr.command = MKHI_GEN_GET_FW_VERSION_CMD;
>    173
>    174          ret = __mei_cl_send(cldev->cl, buf, sizeof(struct mkhi_msg_hdr),
>    175                              MEI_CL_IO_TX_BLOCKING);
>    176          if (ret < 0) {
>    177                  dev_err(&cldev->dev, "Could not send ReqFWVersion cmd\n");
>    178                  return ret;
>    179          }
>    180
>    181          ret = 0;
>    182          bytes_recv = __mei_cl_recv(cldev->cl, buf, sizeof(buf), 0,
>    183                                     MKHI_RCV_TIMEOUT);
>    184          if (bytes_recv < MKHI_FWVER_LEN(1)) {
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ bytes_recv can be negative
> error codes but MKHI_FWVER_LEN() is size_t so they are treated as high positive
> values.
> 
>    185                  /*
>    186                   * Should be at least one version block,
>    187                   * error out if nothing found
>    188                   */
>    189                  dev_err(&cldev->dev, "Could not read FW version\n");
>    190                  return -EIO;
>    191          }
> 
> See also:
> 
>     drivers/misc/mei/bus-fixup.c:196 mei_fwver()
>     warn: 'bytes_recv' possible negative type promoted to high
> 
> 
> regards,
> dan carpenter
