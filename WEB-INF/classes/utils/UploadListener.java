/**
 * Created by jason2009
 * 2015年5月6日 上午10:34:40
 */
package utils;

import org.apache.commons.fileupload.ProgressListener;

public class UploadListener implements ProgressListener {
	private UploadStatus fuploadStatus = null;
	
	public UploadListener(UploadStatus status) {
		super();
		this.fuploadStatus = status;
	}

	/**
	 * 更新状态
	 * @param pBytesRead 读取字节总数
	 * @param pContentLength 数据总长度
	 * @param pItems 当前正在被读取的field号
	 */
	public void update(long pBytesRead, long pContentLength, int pItems) {
		double read = (double) pBytesRead;
		double len = (double) pContentLength;
		fuploadStatus.setUploadTotalSize(pContentLength);
		if (pContentLength == -1) {
			//读取完成
			fuploadStatus.setStatus("100");
			fuploadStatus.setReadTotalSize(pBytesRead);
			fuploadStatus.setCurrentUploadFileNum(pItems);
			fuploadStatus.setProcessEndTime(System.currentTimeMillis());
			fuploadStatus.setProcessRunningTime(fuploadStatus.getProcessEndTime());
		}else{
			//读取过程中
			fuploadStatus.setStatus(""+(read/len)*100);
			fuploadStatus.setReadTotalSize(pBytesRead);
			fuploadStatus.setCurrentUploadFileNum(pItems);
			fuploadStatus.setProcessRunningTime(System.currentTimeMillis());
		}
	}

}
