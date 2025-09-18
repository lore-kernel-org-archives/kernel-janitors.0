Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D452D9EDD
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758180082; cv=none; b=siXMxoPJy3Tl5MVGs6SN71t928lY+7Bxa0PtmUH3h4ki5gW3vWmPOxPh7BlF/HAm0Dg6PPxElcfi57a5kyvTehGCL/hv7eVuVytrmsw3vJToN6MTBCPiFG0W/ttgwZxwvHQzBmMY2TdxFLLkQpFFWTfyPyc3rEbeY0DMU/AS1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758180082; c=relaxed/simple;
	bh=V4wPdZSWipmBgGolTt8Zcu/2RwDoSdAqpu9cJPV7R/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tli+rVlDUka1Ki+slurTCcmfI29AQKrDkLzpgFj+Pa7fO2WUH69BqvFBBuJMQe6z+6VYH/0k4ho9gTTOFY9QwdFi7aK9I8j7Kgwlgz6MnjvUoyPgQac+XCQoaPOCkoU481ltLA2fhxa/X7bT8lSARXgJtEnkmgjwGSBkgr+YCBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fyXw1SwM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fyXw1SwM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso5073455e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 00:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758180078; x=1758784878; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BRqw5ADsL/F2m4TLedmhMHcmfL1LgkTDlIj9ZErDfnQ=;
        b=fyXw1SwMQ/U3Ongi6rlZ+IzyGq94UzwP2lYXVRWmxZrYPsmkGypfObjz6Z8nwdtg66
         HCvWiBgomLtt2WLLCuxXkjxFKNbPY53Ra+VzuXz82ddCam4aqeM/6PZEwzYw41WNRFpS
         JBHbuwaxF6hd7g+OutstZg89949kQ3eYdshp1RH6pMrMBXzz6ZowS4J0lTb1n9E7Sxa1
         QORaWBjTkjv9q5+g9n8lUukDl65EvBr2MDXnui0vL9gEU0f2Hx0HSVIKaWM/GIrkbfUu
         JFfT4xMjSU7Xc2AIru1YAwZQ536hcjEn7zw9twMvaJ61t3Jdi6W/ui0g4lNdy61A+YWM
         WVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758180078; x=1758784878;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRqw5ADsL/F2m4TLedmhMHcmfL1LgkTDlIj9ZErDfnQ=;
        b=i4sIBl7znMrk5aZlnEmFF7s/6iyF1Dbtpe25M6Y/OQsnBdszvAQ+xvp5Xj8jK4eYUe
         NsmGX0PHEwOt4uetiMl0MG/MJvMtXf+4CHC7qOWGaoCoVzveHgG1tZuea7IYjp/R4qxD
         9fLgOJcdpoF971mF6bShWBUHXf2SNg9m0DzONaQNOPY+/sx+aI8fPCWMnC27Mx6uqVOi
         9dt+7PwSpMxh7qflCIZg4OE4Ka2dk/+SiNKzrZ8QaByW63EQYIR1k+hZ2Yk3RQiAQd5s
         dk7UcTFAo0NlBJ0dhlHafMFvGlGiWdu95uNRCp0ylxo2aaNcYvd4caNO075dX0fuyJ39
         xKWQ==
X-Gm-Message-State: AOJu0YzVBb4V4Bc5s4BNswej2d6HiC8TEtukX/v2CsN6KW7e/EYaYH2B
	Xv8OErlrAMvQIzMU/caitPpb0BODSF8e+bXR/bwwBU395LPllv18Ecn2LD86JaTXO9Y=
X-Gm-Gg: ASbGncu7E+jOcq7hCePatDkjbuJXrDygQ4ySZ9dHNPncgYRvZy34Thi/zRsQVypiJyR
	+pcXq0dLxFCorTgmDi8IPMT5802wVT1qXTLKKDlSdu4LLh0EeS/xiuww1+ifuxYlG2Na2Ok1x/J
	LnF4phR5x0qbDUUDtN7qIY2lRIC88SJqqQ8Ruldfkkbt54JJNAATMix3Z3v/+DKgTu1xjrfFtte
	sJDRNADirNPZY2feio3LUgsMiCl9PfQP3/QxuR6ZX6Lz/IRCz235qYO9FznjbCY5D5HmGdZMMt6
	EXo+NpJdpWxkpMtBiyBrY3MY2OKCCWDicaf7tcXZcF+cq+VO38KyED1toaFzLKDYNS/hsYWAhdK
	9138NAZOzjAh4rlDe2CNj3/sl/RUyygAW0J2RzSRIr6gutQ==
X-Google-Smtp-Source: AGHT+IE7R9BOAOiEKhmn6T1Y5BEoKqFTEpWYrAJWWSvV66HP7M/dem394r1K80aJ39Pi6de4T5XG3A==
X-Received: by 2002:a5d:5d10:0:b0:3ec:8c8:7b69 with SMTP id ffacd0b85a97d-3ecdfa07746mr3872119f8f.41.1758180077847;
        Thu, 18 Sep 2025 00:21:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbffaeasm2337388f8f.62.2025.09.18.00.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 00:21:17 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:21:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Fan Gong <gongfan1@huawei.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] hinic3: Queue pair context initialization
Message-ID: <aMuy6mjpKS_9LfI_@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Fan Gong,

Commit 97dcb914a25b ("hinic3: Queue pair context initialization")
from Sep 12, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c:690 init_sq_ctxts()
	error: uninitialized symbol 'out_param'.

drivers/net/ethernet/huawei/hinic3/hinic3_nic_io.c
    647 static int init_sq_ctxts(struct hinic3_nic_dev *nic_dev)
    648 {
    649         struct hinic3_nic_io *nic_io = nic_dev->nic_io;
    650         struct hinic3_hwdev *hwdev = nic_dev->hwdev;
    651         struct hinic3_sq_ctxt_block *sq_ctxt_block;
    652         u16 q_id, curr_id, max_ctxts, i;
    653         struct hinic3_sq_ctxt *sq_ctxt;
    654         struct hinic3_cmd_buf *cmd_buf;
    655         struct hinic3_io_queue *sq;
    656         __le64 out_param;
    657         int err = 0;
    658 
    659         cmd_buf = hinic3_alloc_cmd_buf(hwdev);
    660         if (!cmd_buf) {
    661                 dev_err(hwdev->dev, "Failed to allocate cmd buf\n");
    662                 return -ENOMEM;
    663         }
    664 
    665         q_id = 0;
    666         while (q_id < nic_io->num_qps) {
    667                 sq_ctxt_block = cmd_buf->buf;
    668                 sq_ctxt = sq_ctxt_block->sq_ctxt;
    669 
    670                 max_ctxts = (nic_io->num_qps - q_id) > HINIC3_Q_CTXT_MAX ?
    671                              HINIC3_Q_CTXT_MAX : (nic_io->num_qps - q_id);
    672 
    673                 hinic3_qp_prepare_cmdq_header(&sq_ctxt_block->cmdq_hdr,
    674                                               HINIC3_QP_CTXT_TYPE_SQ, max_ctxts,
    675                                               q_id);
    676 
    677                 for (i = 0; i < max_ctxts; i++) {
    678                         curr_id = q_id + i;
    679                         sq = &nic_io->sq[curr_id];
    680                         hinic3_sq_prepare_ctxt(sq, curr_id, &sq_ctxt[i]);
    681                 }
    682 
    683                 hinic3_cmdq_buf_swab32(sq_ctxt_block, sizeof(*sq_ctxt_block));
    684 
    685                 cmd_buf->size = cpu_to_le16(SQ_CTXT_SIZE(max_ctxts));
    686                 err = hinic3_cmdq_direct_resp(hwdev, MGMT_MOD_L2NIC,
    687                                               L2NIC_UCODE_CMD_MODIFY_QUEUE_CTX,
    688                                               cmd_buf, &out_param);
    689                 if (err || out_param) {
--> 690                         dev_err(hwdev->dev, "Failed to set SQ ctxts, err: %d, out_param: 0x%llx\n",
    691                                 err, out_param);

If err is non-zero then out_param has not been set on this iteration
through the loop.

    692                         err = -EFAULT;
    693                         break;
    694                 }
    695 
    696                 q_id += max_ctxts;
    697         }
    698 
    699         hinic3_free_cmd_buf(hwdev, cmd_buf);
    700 
    701         return err;
    702 }

regards,
dan carpenter
