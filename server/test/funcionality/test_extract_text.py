
def test_upload_pdf(client, upload_pdf):
    files = {"file": ("2008_Book_TheAlgorithmDesignManual.pdf", upload_pdf, "application/pdf")}
    response = client.post("/manuals/upload", files=files)
    text = response.json()
    print(text)
    assert response.status_code == 200



