From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Feb 2019 20:12:21 +0000
Subject: [bug report] habanalabs: add h/w queues module
Message-Id: <20190220201221.GA21409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Oded Gabbay,

The patch 9494a8dd8d22: "habanalabs: add h/w queues module" from Feb
16, 2019, leads to the following static checker warning:

	drivers/misc/habanalabs/goya/goya.c:3386 goya_test_cpu_queue()
	error: uninitialized symbol 'result'.

drivers/misc/habanalabs/goya/goya.c
    3367 int goya_test_cpu_queue(struct hl_device *hdev)
    3368 {
    3369 	struct armcp_packet test_pkt;
    3370 	long result;
    3371 	int rc;
    3372 
    3373 	/* cpu_queues_enable flag is always checked in send cpu message */
    3374 
    3375 	memset(&test_pkt, 0, sizeof(test_pkt));
    3376 
    3377 	test_pkt.ctl = ARMCP_PACKET_TEST << ARMCP_PKT_CTL_OPCODE_SHIFT;
    3378 	test_pkt.value = ARMCP_PACKET_FENCE_VAL;
    3379 
    3380 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &test_pkt,
    3381 			sizeof(test_pkt), HL_DEVICE_TIMEOUT_USEC, &result);
                                                                          ^^^^^^^
Presumably, result isn't set on all failure paths.

    3382 
    3383 	if (!rc)
    3384 		dev_info(hdev->dev, "queue test on CPU queue succeeded\n");
    3385 	else
--> 3386 		dev_err(hdev->dev, "CPU queue test failed (0x%08lX)\n", result);
                                                                                ^^^^^^
    3387 
    3388 	return rc;
    3389 }

regards,
dan carpenter
