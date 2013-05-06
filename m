From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 May 2013 14:28:51 +0000
Subject: re: mei: implement mei_cl_connect function
Message-Id: <20130506142851.GA10716@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Tomas Winkler,

The patch 9f81abdac362: "mei: implement mei_cl_connect function" from 
Jan 8, 2013, leads to the following static checker warning:
"drivers/misc/mei/main.c:522 mei_ioctl_connect_client()
	 warn: check 'dev->me_clients[]' for negative offsets (-2)"

drivers/misc/mei/main.c
   490          /* find ME client we're trying to connect to */
   491          i = mei_me_cl_by_uuid(dev, &data->in_client_uuid);
   492          if (i >= 0 && !dev->me_clients[i].props.fixed_address) {
                    ^^^^^^
We check that i is not -ENOENT here.

   493                  cl->me_client_id = dev->me_clients[i].client_id;
   494                  cl->state = MEI_FILE_CONNECTING;
   495          }
   496  
   497          dev_dbg(&dev->pdev->dev, "Connect to FW Client ID = %d\n",
   498                          cl->me_client_id);
   499          dev_dbg(&dev->pdev->dev, "FW Client - Protocol Version = %d\n",
   500                          dev->me_clients[i].props.protocol_version);
                                ^^^^^^^^^^^^^^^^^^
But on the rest of the function -ENOENT is not handled as an error.

   501          dev_dbg(&dev->pdev->dev, "FW Client - Max Msg Len = %d\n",
   502                          dev->me_clients[i].props.max_msg_length);
   503  

regards,
dan carpenter

