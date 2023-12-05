function noiseReducedImg = AMIE(img)

    % Apply adaptive histogram equalization to each color channel
    for channel = 1:3
        img(:,:,channel) = adapthisteq(img(:,:,channel), 'cliplimit', 0.01, 'Distribution', 'uniform');
    end

    % Unsharp Masking applied to each channel
    for channel = 1:3
        sharpenedImg(:,:,channel) = imsharpen(img(:,:,channel), 'Radius', 1, 'Amount', 1);
    end

    % Perform Gaussian filter on each channel
    for channel = 1:3

        noiseReducedImg(:,:,channel)=imgaussfilt(sharpenedImg(:,:,channel),2);
    end


end
